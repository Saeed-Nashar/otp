import 'package:flutter/material.dart';

import '../UICard/AvatarCard.dart';
import '../model/chatModel.dart';
import '../UICard/contactCard.dart';

class GreateGroup extends StatefulWidget {
  @override
  _GreateGroupState createState() => _GreateGroupState();
}

class _GreateGroupState extends State<GreateGroup > {
  List<chatModel> contacts = [
    chatModel(
      name: "Saeed Nashar",
      icon: "assets/person.svg",
      status: "developer", isGroup:true, time: '', currentMessage: '',
    ),
    chatModel(
        name: "yousef", icon: "assets/person.svg", status: "football palyer",isGroup:true, time: '', currentMessage: '', ),
    chatModel(
        name: "khaled", icon: "assets/person.svg", status: "football palyer",isGroup:true, time: '', currentMessage: '',),
    chatModel(
        name: "samar", icon: "assets/person.svg", status: "engineer IT",isGroup:true, time: '', currentMessage: '',),
  ];
  List<chatModel> groups=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Add participants",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),

        ],
      ),

      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length+1 ,
              itemBuilder: (context, index) {
                if(index==0){
                  return Container(
                    height: groups.length>0?90:10,
                  );
                }
                return InkWell(
                  onTap: (){
                    if(contacts[index-1].select==false){
                      setState(() {
                        contacts[index-1].select=true;
                        groups.add(contacts[index-1]);
                      });
                    }
                    else{
                      setState(() {
                      contacts[index-1].select=false;
                      groups.remove(contacts[index-1]);
                    });

                    }
                  },
                  child: contactCard(
                    contact: contacts[index-1],
                  ),
                );
              }),
       groups.length>0?Column(
        children: [
          Container(
                height: 70,
                color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,
                itemBuilder: (context,index)
                  {
                    if(contacts[index].select==true){
                                   return InkWell(
                                     onTap: (){
                                       setState(() {
                                         contacts[index].select=false;
                                         groups.remove(contacts[index]);

                                       });
                                     },
                                     child: AvatarCard(
                                         contacts[index]
                                     ),
                                   );}
                    else{return Container();}
                  }
                 ),
              ),
          Divider(
            thickness: 1,
          ),
        ],
      ):Container(),
        ],
      ),
    );
  }
}
