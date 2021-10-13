import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/chatModel.dart';


class contactCard extends StatelessWidget {
  final chatModel contact;

  const contactCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
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
           contact.select ?Positioned(
              bottom: 5,
              right: 4,
              child: CircleAvatar(
                  backgroundColor:Colors.teal,
                  radius: 11,
                  child: Icon(Icons.check,color: Colors.white,size: 18,)),
            ):Container(),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
