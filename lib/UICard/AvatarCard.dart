
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/chatModel.dart';

class AvatarCard extends StatelessWidget {

  final chatModel contact;

  const AvatarCard( this.contact);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                /*  صفحة select Contact  */
                radius: 23,
                child: SvgPicture.asset(
                  contact.icon,
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Colors.blueGrey,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor:Colors.grey,
                    radius: 11,
                    child: Icon(Icons.clear,color: Colors.white,size: 18,)),
              ),
            ],
          ),
          SizedBox(height: 2,),
          Text(contact.name,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
