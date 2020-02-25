import 'package:demofirebase/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String titleString ="LoginPage";
  var textEditController = new TextEditingController();
  var textEditController1 = new TextEditingController();

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  Widget showlogo(){
    return Image.asset('images/artist.png',width: 110,);
  }

  Widget showTaxt(){
    return Text('Welcom To My Page',
    style: TextStyle(
      fontSize: 30.0,
      fontWeight:FontWeight.bold,
      color:Colors.pinkAccent
    ),
    );
  }

  Widget emailText(){
    return Container(
      width: 300.0,
        child: TextFormField(
        controller: textEditController,
        decoration: InputDecoration(
          icon: Icon(Icons.email,
          size: 30.0,
          color: Colors.pinkAccent,
          ),
          labelText: 'Username',
          hintText: 'youremail@gmail.com'
        ),
      ),
      
    );
  }

  Widget passText(){
    return Container(
      width: 300.0,
      child: TextFormField(
        obscureText: true,
        controller: textEditController1,
        decoration: InputDecoration(
          icon: Icon(Icons.vpn_key,
          size : 30.0,
          color: Colors.pinkAccent,
          ),
          labelText: 'Password',
          hintText: 'more 8 charactor'
        
        ),
      
      ),
    );
  }
  Widget card(){
    return Container(
      width:350.0 ,height: 350.0,
      child: Card(
        color: Colors.tealAccent,
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('\n'),
            showTaxt(),
            Text('\n'),
            emailText(),
            passText(),
            Text('\n'),
            buttonlogin(),
          ],
        ),
      ),
    );
  }

  Widget buttonlogin(){
    return Container(
      width: 300.0,
      height: 50.0,
      child: RaisedButton.icon(
        color: Colors.purpleAccent,
        icon: Icon(Icons.people,
        size: 30.0,
      ),
      label: Text('LOGIN'),
      onPressed: (){
        var route = MaterialPageRoute(
            builder: (BuildContext context) => Home()
          );
          Navigator.of(context).push(route);
      },
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration : BoxDecoration(image: DecorationImage(image: AssetImage('images/NW.jpeg'),fit: BoxFit.fill)),
          child: Center(
            child :Column(
              mainAxisSize:MainAxisSize.min,
              children:<Widget>[
                showlogo(),
                card(),
                
              ],
            ),
          ),
        ),
        ),
    );
  }
}