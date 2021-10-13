import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z/NewScreen/Auth_Screen.dart';

import 'LoginScreen.dart';


class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome to ChatApp",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 29,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Image.asset(
              "assets/10.png",
              color: Colors.greenAccent[700],
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: "Agree and Continue to accept the",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextSpan(
                      text: "ChatApp Terms of Service and Privacy Policy",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => authScreen(),
                    //    LoginScreen() just to know if we can use it
                    ),
                    (rout) => false);
              },
              child: Container(
                //color: Colors.blueGrey[400],
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                child: Card(
                  margin: EdgeInsets.all(0),
                  elevation: 1,
                  color: Colors.greenAccent[700],
                  child: Center(
                    child: Text(
                      "AGREE AND CONTINUE",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
