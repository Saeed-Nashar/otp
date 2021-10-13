import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:z/UICard/Auth_Form.dart';



class authScreen extends StatefulWidget {
  @override
  _authScreenState createState() => _authScreenState();
}

class _authScreenState extends State<authScreen> {
  final _Auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void _submitAuth(String email, String password, String username, bool islogin,
      BuildContext ctx) async {
    UserCredential AuthResult;

    try {
      setState(() {
        _isLoading=true;
      });
      if (islogin) {
        AuthResult = await _Auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        AuthResult = await _Auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(AuthResult.user!.uid)
            .set({
          'username': username,
          'password': password,
        });
      }
    } on FirebaseAuthException catch (e) {
      String message = "error occurred";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
      setState(() {
        _isLoading=false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal, body: authForm(_submitAuth,_isLoading));
  }
}
