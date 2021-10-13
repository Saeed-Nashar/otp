import 'package:flutter/material.dart';


class authForm extends StatefulWidget {

  final void Function(String email, String password, String username, bool islogin, BuildContext context) submitFn;
  final bool _isloading;

  authForm(this.submitFn,this._isloading);
  @override
  _authFormState createState() => _authFormState();
}

class _authFormState extends State<authForm> {
  final _formkey=GlobalKey<FormState>();
  Map <String,String> AuthData={
    'email':'',
    'password':'',
    'username':'',
  };
  bool _islogin=true;
  String _email="";
  String _password="";
  String _username="";

  void _submit(){
    final isValid=_formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if(isValid){

      _formkey.currentState!.save();
      widget.submitFn(_email.trim(),_password.trim(),_username.trim(),_islogin,context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: ValueKey("email"),
                  decoration: InputDecoration(labelText: "E_mail Address"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val){
                    if(val!.isEmpty || !val.contains("@"))
                    {
                      return "please enter a valid email address";
                    }return null;
                  },

                  onSaved: (val)=>_email=val!,
                ),
                if(!_islogin)
                  TextFormField(
                    key: ValueKey("Username"),
                    decoration: InputDecoration(labelText: "Username"),
                    validator: (val){
                      if(val!.isEmpty || val.length<4)
                      {
                        return "please enter at least 4 characters";
                      }return null;
                    },

                    onSaved: (val)=>_username=val!,
                  ),
                TextFormField(
                  key: ValueKey("password"),
                  decoration: InputDecoration(labelText: "password"),
                  validator: (val){
                    if(val!.isEmpty || val.length<7)
                    {
                      return "password must be at least 7 characters";
                    }return null;
                  },
                  onSaved: (val)=>_password=val!,
                  obscureText: true,
                ),
                SizedBox(height: 12,),
                if(widget._isloading)
                  CircularProgressIndicator(),
                if(!widget._isloading)
                  ElevatedButton(
                    child:Text(_islogin?'login':'Sign Up'),
                    onPressed: _submit,
                  ),
                if(!widget._isloading)
                  TextButton(
                    child: Text(_islogin?'Creat a new account':'I already have an account'),
                    onPressed: (){
                      setState(() {
                        _islogin=!_islogin;
                      });
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
