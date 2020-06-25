

import 'package:attendenceapp/sequrityForm.dart';
import 'package:attendenceapp/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SignupForm extends StatefulWidget{
  @override
  _SignupForm createState() => _SignupForm();
}
class _SignupForm extends State<SignupForm> {
  bool validate;
  int formindex;
  final namecontroller = TextEditingController();
  final rollnocontroller = TextEditingController();
  final pwdcontroller = TextEditingController();
  final mobcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    validate = false;
    formindex=1;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),

        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            SizedBox(height: 10.0,),
            TextFormField(
              controller: namecontroller,
              inputFormatters: [
                WhitelistingTextInputFormatter(
                  RegExp("[a-zA-Z ]"),
                )
              ],
              maxLength: 6,


              decoration: InputDecoration(
                hintText: "Enter Your Name",
                errorText: validate ? 'Please Enter Your Name' : null,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              controller: rollnocontroller,
              inputFormatters: [
                WhitelistingTextInputFormatter(
                    RegExp("[0-9A-Z]")
                )
              ],
              decoration: InputDecoration(
                errorText: validate ? 'Please Enter Your rollno.' : null,
                hintText: "Enter RollNo",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              controller: pwdcontroller,
              obscureText: true,
              inputFormatters: [
                WhitelistingTextInputFormatter(
                    RegExp("[a-zA-Z_@0-9%&*!#-+]")
                )
              ],
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                errorText: validate ? "Please Enter Your Password" : null,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              controller: mobcontroller,
              maxLength: 10,
              maxLengthEnforced: true,
              inputFormatters: [
                WhitelistingTextInputFormatter(
                  RegExp("[0-9]"),

                )
              ],
              decoration: InputDecoration(
                hintText: "Enter Your MobileNo.",
                errorText: validate ? "Please Enter Your Mobile no." : null,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),

            Container(

              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
              GestureDetector(child:Text("Security Questions",style: securityStyle,),
              onTap: (){
                setState(() {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SequrityForm()));

                });
              },),
                 IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.green,size:30,),
                 ),

                ],
              )
              ),

            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),

                ),
                child: Text("Submit", style: btnstyle),
                onPressed: _submitprocess
            ),
          ],
        )
    );
  }

  void _submitprocess() {
    String name = namecontroller.text;
    String rollno = rollnocontroller.text;
    String pwd = pwdcontroller.text;
    String mobno = mobcontroller.text;
    setState(() {
      if (rollno.isEmpty || name.isEmpty || pwd.isEmpty || mobno.isEmpty ?
      validate = true : validate = false)
        print("value is empyt");
      else {
        print("Submitted...");
      }
    });
  }

}

