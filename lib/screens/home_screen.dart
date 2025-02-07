import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IO.Socket socket;
  final TextEditingController messageController = TextEditingController();
  User? user;
  List<Map<String, dynamic>> messages = [];
  final AuthService _authService = AuthService();


  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // Obtener usuario autenticado de Firebase
  void getCurrentUser() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        user = currentUser;
      });
      connectSocket();
    }
  }

  void connectSocket() {
    socket = IO.io("http://192.168.1.31:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect();
    socket.emit("joinRoom", "global_chat");

    // Cargar mensajes antiguos
    socket.on("loadMessages", (data) {
      setState(() {
        messages = List<Map<String, dynamic>>.from(data);
      });
    });

    // Escuchar nuevos mensajes
    socket.on("newMessage", (data) {
      setState(() {
        messages.add(data);
      });
    });
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      socket.emit("sendMessage", {
        "remitente": user!.displayName ?? user!.email,
        "texto": messageController.text,
      });
      messageController.clear();
    }
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: user != null ? Text("Chat de ${user!.displayName ?? user!.email}") : Text("Cargando..."),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authService.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ListTile(
                  title: Text(msg["remitente"], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(msg["texto"]),
                  trailing: Text(msg["hora"]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: "Escribe un mensaje"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
