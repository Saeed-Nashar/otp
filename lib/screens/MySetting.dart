import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                   icon: Icon(Icons.arrow_back, size: 23,),
                  color: Colors.black,

                ),
              ],
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                "saeed Nashar",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "saeed@gmail.com",
                style: TextStyle(color: Colors.grey[700]),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
            ),
            Divider(
              color: Colors.grey[500],
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: ListTile(
                  title: Text(
                    "account",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  leading: Icon(
                    Icons.vpn_key,
                    color: Colors.teal,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey[500],
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: ListTile(
                  title: Text(
                    "chats",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  leading: Icon(
                    Icons.message,
                    color: Colors.teal,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey[500],
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: ListTile(
                  title: Text(
                    "Storage and data",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  leading: Icon(
                    Icons.data_usage,
                    color: Colors.teal,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey[500],
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                child: ListTile(
                  title: Text(
                    "Help",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  leading: Icon(
                    Icons.help,
                    color: Colors.teal,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
