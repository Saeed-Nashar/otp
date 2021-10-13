import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:z/screens/homescreem.dart';

class otpScreen extends StatefulWidget {
  final String countryCode;
  final String Number;

  const otpScreen({ required this.countryCode, required this.Number}) ;

  @override
  _otpScreenState createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "verify ${widget.countryCode} ${widget.Number}",
          style: TextStyle(fontSize: 17, color: Colors.teal[500]),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
           /*  هنا*/ color: Colors.black, onPressed: () {  },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    children: [
                 TextSpan(
                  text: "we have sent an SMS with a code to",
                  style: TextStyle(color: Colors.black,fontSize: 14.5,),),

                  TextSpan(
                      text: widget.countryCode+" "+widget.Number,
                      style: TextStyle(color: Colors.black,fontSize: 14.5,fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "Wrong number?",
                    style: TextStyle(color: Colors.cyan[400],fontSize: 14.5,),),

                ])),
            SizedBox(height: 5,),
        /*   OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 30,
              style: TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),*/
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Homescreen()),
                                (route) => false);
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    _scaffoldkey.currentState!
                        .showSnackBar(SnackBar(content: Text('invalid OTP')));
                  }
                },
              ),
            ),

            SizedBox(height: 20,),
            Text("Enter 6-digit code",style: TextStyle(
                fontSize: 14.5,
              color: Colors.grey[600]
            ),),
            SizedBox(height: 30,),
             BottomBottn("Resend SMS",Icons.message),
            SizedBox(height: 12,),
            Divider(
              thickness: 1.5,
            ),
            BottomBottn("Call me", Icons.call),
          ],
        ),
      ),
    );
  }

  Widget BottomBottn(String text,IconData icon){
      return  Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
            size: 24,
          ),
          SizedBox(
            width: 25,
          ),
          Text(text,style:TextStyle(color: Colors.teal,fontSize: 14.5),),
        ],
      );


  }

_verifyPhone() async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber:'${widget.countryCode}${widget.Number}',
    verificationCompleted: (PhoneAuthCredential credential) async {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (value.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
                  (route) => false);
        }
      });
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e.message);

      codeSent:
          (String verficationID, int resendToken) {
        setState(() {
          _verificationCode = verficationID;
        }
        );
      };
    },
    codeAutoRetrievalTimeout: (String verificationID) {
      setState(() {
        _verificationCode = verificationID;
      });
    }, codeSent: (String verificationId, int? forceResendingToken) {
    setState(() {
      _verificationCode = verificationId;
    }
    );
  },

  );}

@override
void initState() {
  // TODO: implement initState
  super.initState();
  _verifyPhone();
}
}

