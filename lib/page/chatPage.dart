import 'package:flutter/material.dart';
import '../screens/selectcontact.dart';


import '../model/chatModel.dart';
import '../UICard/customCard.dart';

class chatPage extends StatefulWidget {
  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  List <chatModel> chats=[
     chatModel(
        name:"saeed",
        icon:"person.svg",
      isGroup:false,
      time:"4:00",
      currentMessage:"hi", status: "",
        ),
    chatModel(
      name:"yousef",
      icon:"person.svg",
      isGroup:false,
      time:"16:00",
      currentMessage:"How are you",
      status: ""
    ),
    chatModel(
      name:"kareem",
      icon:"groups.svg",
      isGroup:true,
      time:"6:00",
      currentMessage:"what are you doing",
        status: ""
    ),
    chatModel(
      name:"samar",
      icon:"person.svg",
      isGroup:false,
      time:"2:00",
      currentMessage:"Hi",
        status: ""
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (builder)=>selectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder:(context,index)=>customCard(
          chatmodel:chats[index],
        ),
      ),
    );
  }
}
