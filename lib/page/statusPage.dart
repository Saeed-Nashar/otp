import 'package:flutter/material.dart';

import '../UICard/StatysPage ui/HeadOnStatus.dart';
import '../UICard/StatysPage ui/OtherStatus.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(Icons.edit, color: Colors.blueGrey[900],),
            ),
          ),
          SizedBox(height: 13,),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   SizedBox(height: 10,),
            HeadOwnStatus(),
           label("Recent updates"),
            OtherStatus(
              name: "Yazen Sheikh Mohammed ",
              time: "0.1:30",
              imageName: "assets/5.jpg",
              isSeen: false,
              statusNum: 2,
            ),
            OtherStatus(
              name: "Abd AlRahman Al-Naasan ",
              time: "5:30",
              imageName: "assets/6.jpg",
              isSeen: false,
              statusNum: 1,
            ),
            SizedBox(height: 10,),
            label("Viewed updates"),
            OtherStatus(
              name: "Yazen Sheikh Mohammed ",
              time: "0.1:30",
              imageName: "assets/5.jpg",
              isSeen: true,
              statusNum: 3,
            ),
            OtherStatus(
              name: "Abd AlRahman Al-Naasan ",
              time: "5:30",
              imageName: "assets/6.jpg",
              isSeen: true,
              statusNum: 10,
            ),
          ],
        ),
      ),
    );
  }


  Widget label( String lebalName) {
    return Container(
      height: 33,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
        child: Text(lebalName,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
      ),
    );

  }
}