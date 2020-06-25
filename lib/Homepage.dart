import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  String rollno,pwd;
  HomePage({this.rollno,this.pwd});
  @override
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Row(
        children:<Widget>[
          Text(widget.rollno),
      Text(widget.pwd),])

    );
  }
}