import 'dart:html';

import 'package:attendenceapp/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Homepage.dart';

class LoginForm extends StatefulWidget{
  LoginForm({Key key}) : super(key: key);
  @override
  _LoginForm createState() => _LoginForm();
}
class _LoginForm extends State<LoginForm>{

  final rollnocontroller = TextEditingController();
  final pwdcontroller = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {

    return Container(
      width:500,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(20.0),

      ),
      child:ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          SizedBox(height: 10.0,),
          TextFormField(
            controller: rollnocontroller,
            maxLength: 6,

            inputFormatters: [
              WhitelistingTextInputFormatter(
                RegExp("[0-9A-Z]"),
              )
            ],
            decoration: InputDecoration(
              hintText: "Enter RollNo.",
              errorText: _validate ? 'Please Enter Rollno' : null,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0,),
          TextField(
            maxLength: 10,
            inputFormatters: [
              WhitelistingTextInputFormatter(
                RegExp("[a-zA-Z_@0-9%&*!#-+]")
              )
            ],
            controller: pwdcontroller,

            decoration: InputDecoration(
              hintText: "Enter PassWord",
              errorText: _validate ? 'Please Enter Password' : null,
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height:20.0),
          RaisedButton(
            color:Colors.red,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),

            ),
            child:Text("Login",style:btnstyle),
            onPressed: _loginProcess,
          ),
        ],
      )
    );

  }
  void _loginProcess(){

    String rollno = rollnocontroller.text;
    String pwd = pwdcontroller.text;
    setState(() {
      if(rollno.isEmpty ? _validate = true : _validate = false || pwd.isEmpty ? _validate = true :_validate = false)
        print("value is empyt");
      else{
        if(rollno == '17CS01' && pwd == '17CS01'){
          print("Matched");
          Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(rollno:rollno,pwd:pwd)));


        }
        else
          print("Wrong Passoword");
      }


    });

  }

}