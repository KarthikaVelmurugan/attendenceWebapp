import 'package:attendenceapp/signupform.dart';
import 'package:attendenceapp/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginform.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroPage(),
  ));
}
class IntroPage extends StatefulWidget{
  @override
  _IntroPage createState() => _IntroPage();
}
class _IntroPage extends State<IntroPage>{

  bool formVisible;
  int formindex;
  @override
  void initState(){
    super.initState();
    formVisible =false;
    formindex=1;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:ExactAssetImage('assets/clg.jpeg'),
          fit:BoxFit.cover)
        ),
        foregroundDecoration: BoxDecoration(
          color:Colors.black54
        ),
        child:SafeArea(
    child:Stack(

          fit: StackFit.expand,
          children: <Widget>[
            Container(
    color:Colors.black54,
            child:Column(
      children:<Widget>[
            SizedBox(height:50),
            Text("Welcome",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30,),textAlign: TextAlign.center,),
            SizedBox(height:500),
            Row(
              children: <Widget>[
                SizedBox(width: 300,),
                Expanded(
                    child:RaisedButton(
                    color:Colors.red,
                    textColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child:Text("Login",style:btnstyle),
                    onPressed: (){
                      setState(() {
                        formVisible=true;
                        formindex =1;

                      });

                    },
                  )
                ),
                SizedBox(width: 200,),
                Expanded(


                child:RaisedButton(
                  color:Colors.grey,
                  textColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40.0),
                  ),
                  child:Text("Signup",style:btnstyle),
                  onPressed: (){
                    setState(() {
                      formVisible= true;
                      formindex=2;
                    });
                  },
                )
                ),
              SizedBox(width: 300,)],
            )


          ],
        )
      ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: (!formVisible)
                ? null
                  :
                Container(
                  color:Colors.black54,
                  alignment: Alignment.center,
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 20,),
                          RaisedButton(
                            textColor: formindex == 1 ? Colors.white : Colors.black,
                            color: formindex == 1 ? Colors.red : Colors.white,
                            child:Text("Login",style:btnstyle),
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),

                            ),
                            onPressed: (){
                              setState(() {
                                formindex =1;
                              });
                            },
                          ),
                          SizedBox(width:80),
                          RaisedButton(
                            textColor: formindex ==2 ? Colors.white : Colors.black,
                            color:formindex == 2 ?Colors.red  : Colors.white,
                            child:Text("Signup",style:btnstyle),
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),

                            ),
                            onPressed: (){
                              formindex =2;
                            }







                            ,
                          ),
                          SizedBox(width: 100,),
                          IconButton(
                            color:Colors.white,
                            icon: Icon(Icons.clear),
                            onPressed: (){
                              setState(() {
                                formVisible = false;
                              });
                            },
                          )

                        ],
                      ),
                      Container(
                        child:AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          child: formindex == 1 ? LoginForm() : SignupForm()
                        )
                      )
                    ],

                )
              )
            )

      ]))) );
  }

}