import 'package:demofirebase/authentication/loginpage.dart';
import 'package:demofirebase/screen/home.dart';
import 'package:flutter/material.dart';
//import 'package:mareeya/screeen/home.dart';
//import 'package:mareeya/screeen/raadDatabase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime
      ),
      title: 'test1',
      debugShowCheckedModeBanner: false,
      //home: Text('DATA'),
      home:LoginPage(),
      
    );
  }
}