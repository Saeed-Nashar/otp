import 'package:flutter/material.dart';

import 'GreateGroup.dart';
import '../UICard/buttomCard.dart';
import '../model/chatModel.dart';
import '../UICard/contactCard.dart';


class selectContact extends StatefulWidget {
  @override
  _selectContactState createState() => _selectContactState();
}

class _selectContactState extends State<selectContact> {
  List<chatModel> contacts = [
    chatModel(
      name: "Saeed Nashar",
      icon: "assets/person.svg",
      status: "developer", isGroup:true, time: '', currentMessage: '',
    ),
    chatModel(
        name: "yousef", icon: "assets/person.svg", status: "football palyer",isGroup:true, time: '', currentMessage: '',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "256 Contacts",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Invite a friend"),
                value: "Invite a friend",
              ),
              PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          }),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>GreateGroup()));
                },
                child: buttomCard(
                  icon: Icons.group_add,
                  name: "New group",
                ),
              );
            } else if (index == 1) {
              return buttomCard(
                icon: Icons.person_add,
                name: "New Contacts",
              );
            }
            return contactCard(
              contact: contacts[index - 2],
            );
          }),
    );
  }
}
