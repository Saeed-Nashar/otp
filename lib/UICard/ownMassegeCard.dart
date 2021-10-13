import 'package:flutter/material.dart';
class ownMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width-45,
          ),
        child:  Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.only(left: 10,right: 60,top: 5,bottom: 20),
              child: Text("Hey akjfhskdf skjdfhksjdf sdjfksjdf klsdjf hdhdhhd jjdjd jjjd jjjd  skjdfhksjdfh",style: TextStyle(fontSize: 15),),
              ),
              Positioned(
                bottom:0,
                right: 10,
                child: Row(
                  children: [
                    Text("20:58",style: TextStyle(fontSize: 13),),
                    SizedBox(width: 5,),
                    Icon(Icons.done_all),
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
