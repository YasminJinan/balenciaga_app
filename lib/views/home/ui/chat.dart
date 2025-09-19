import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:http/http.dart' as http;


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}
// Ambil semua chat history
// Ubah format biar Gemini ngerti
// Kirim ke API
// Terima jawaban
// Simpan ke _chatHistory biar tampil di UI

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String , dynamic>> _chatHistory = [];

void getAnswer() async {
  final apiKey = "AIzaSyAGAJ0hWk8tvEF8l0Oe7C5soSgIOHH71N0";
  final url = Uri.parse(
    "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent",
  );


  List<Map<String, dynamic>> msg = [];
  for (var i = 0; i < _chatHistory.length; i++) {
    msg.add({
      "role": _chatHistory[i]["isSender"] ? "user" : "model",
      "parts": [
        {"text": _chatHistory[i]["message"]}
      ]
    });
  }

  Map<String, dynamic> request = {
    "contents": msg,
  };


  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "X-goog-api-key": apiKey,
      },
      body: jsonEncode(request),
    );
    
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final candidates = data["candidates"] as List<dynamic>;

      setState(() {
        if (candidates.isNotEmpty) {
          _chatHistory.add({
            "time": DateTime.now(),
            "message": candidates[0]["content"]["parts"][0]["text"] ?? "No response",
            "isSender": false,
          });
        } else {
          _chatHistory.add({
            "time": DateTime.now(),
            "message": "Sorry, I can't answer that",
            "isSender": false,
          });
        }
      });
    } else {
      print("Error ${response.statusCode}: ${response.body}");
    }
  } catch (e) {
    print("Exception: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat", style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Stack(
        children: [
          Container(
            //get max height
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              shrinkWrap: false,
              controller: _scrollController,
              padding:  EdgeInsets.only(top: 10, bottom: 10),
              physics:  BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (
                      _chatHistory[index]['isSender']?Alignment.topRight:Alignment.topLeft
                    ),
                    
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3)
                        )],
                        color:
                        (_chatHistory[index]["isSender"]?Color(0xFFF69170):Colors.white),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(_chatHistory[index]["message"],
                      style: TextStyle(fontSize: 15, color: 
                      (_chatHistory[index]["isSender"]?Colors.white:Colors.black),
                      ),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: GradientBoxBorder(gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                           colors: [
                      Color(0xFFF69170),
                      Color(0xFF7D96E6),
                           ],
                        ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8.0)
                        ),
                        controller: _chatController,
                      ),
                      ),
                      ),
                    ),
                    const SizedBox(width: 4.0,),
                    // ini buat function async utk mendapat jawaban dr API
                    MaterialButton(onPressed: () {
                    setState(() {
                      if (_chatController.text.isNotEmpty) {
                        _chatHistory.add({
                          "time" : DateTime.now(),
                          "message" : _chatController.text,
                          "isSender" : true,
                        });
                        _chatController.clear();
                        
                      }
                    });
                    _scrollController.jumpTo(
                      _scrollController.position.maxScrollExtent
                    );
                    getAnswer();
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFF69170),
                            Color(0xFF7D96E6),
                          ]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                        alignment: Alignment.center,
                        child: Icon(Icons.send, color: Colors.white,),
                      ),
                    ),
                    )
                    ]
                  )
              ),
            ),
        ],
      ),
    );
  }
}