import 'package:demofirebase/screen/iot_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool modeBool = false, led1Bool=false,sw1Bool=false,fan1Bool=false,air1Bool=false;
  int modeInt=0, led1Int=0, sw1Int=0, fan1Int=0, air1Int=0;
  String namestr="";
  IotModel iotModel;

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future <void> readData() async {
    print('Read Data Work');

    DatabaseReference databaseReference = firebaseDatabase.reference().child('IoT');
    await databaseReference.once().then((DataSnapshot dataSnapshot){
      print('data=>${dataSnapshot.value}');//ทุกอย่างใน document ถูกอ่านหมดเลย
      // Map <dynamic,dynamic> values= dataSnapshot.value;
      // values.forEach((key,values){
      //   print(values['led1']);
      // });
      iotModel=IotModel.formMap(dataSnapshot.value);
      modeInt=iotModel.mode;
      led1Int=iotModel.led1;
      sw1Int=iotModel.sw1;
      fan1Int=iotModel.fan1;
      air1Int=iotModel.air1;
      namestr=iotModel.namestr;
      checkSwitch();
    });
   
  }

  Future<void> editDatabase() async{//โยนค่าขึ้น firebase
    print('mode=$modeBool');
    FirebaseDatabase firebaseDatabase= FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference().child('IoT');

    Map<dynamic,dynamic> map = Map();
    map['mode']=modeInt;
    map['led1']=led1Int; //โยนขึ้น firebase
    map['sw1']=sw1Int;
    map['fan1']=fan1Int;
    map['air1']=air1Int;

    await databaseReference.set(map).then((response){
      print('Edit Success');
    });
  }

  void checkSwitch(){
    setState(() {
      if(iotModel.mode==0){
        modeBool=false;
      }
      else{
        modeBool=true;
      }

      if(iotModel.led1==0){
        led1Bool=false;
      }
      else{
        led1Bool=true;
      }

      if(iotModel.sw1==0){
        sw1Bool=false;
      }
      else{
        sw1Bool=true;
      }

      if(iotModel.fan1==0){
        fan1Bool=false;
      }
      else{
        fan1Bool=true;
      }

      if(iotModel.air1==0){
        air1Bool=false;
      }
      else{
        air1Bool=true;
      }
    });
    print('mode=$modeBool,led1=$led1Bool,sw1=$sw1Bool,fan1=$fan1Bool,air1=$air1Bool');
  }

  Widget switchMode(){
    return Container(
      width: 200,
      child: Card(
        color:Colors.purple.shade300,
        child: Container(
          padding:EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('Mode'),
              Row(
                children: <Widget>[
                  Text('Auto'),
                  Switch(
                    value: modeBool, 
                    onChanged:(bool value){
                      changModeBool(value);
                    },
                    ),
                  Text('Manual')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchLed1(){
    return Container(
      width: 200,
      child: Card(
        color:Colors.yellowAccent.shade200,
        child: Container(
          padding:EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('Led1'),
              Row(
                children: <Widget>[
                  Text('Off'),
                  Switch(
                    value: led1Bool, 
                    onChanged:(bool value){
                      changLed1Bool(value);
                    },
                    ),
                  Text('On')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchSw1(){
    return Container(
      width: 200,
      child: Card(
        color:Colors.yellowAccent.shade200,
        child: Container(
          padding:EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('SW1'),
              Row(
                children: <Widget>[
                  Text('Off'),
                  Switch(
                    value: sw1Bool, 
                    onChanged:(bool value){
                      changSw1Bool(value);
                    },
                    ),
                  Text('On')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchFan1(){
    return Container(
      width: 200,
      child: Card(
        color:Colors.yellowAccent.shade200,
        child: Container(
          padding:EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('Fan1'),
              Row(
                children: <Widget>[
                  Text('Off'),
                  Switch(
                    value: fan1Bool, 
                    onChanged:(bool value){
                      changFan1Bool(value);
                    },
                    ),
                  Text('On')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchAir1(){
    return Container(
      width: 200,
      child: Card(
        color:Colors.yellowAccent.shade200,
        child: Container(
          padding:EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('Air1'),
              Row(
                children: <Widget>[
                  Text('Off'),
                  Switch(
                    value: air1Bool, 
                    onChanged:(bool value){
                      changair1Bool(value);
                    },
                    ),
                  Text('On')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changModeBool(bool value){
    setState(() {
      modeBool=value;
      if(modeBool){
        modeInt=1;
      }
      else{
        modeInt=0;
      }
      editDatabase();
    });
  }

  void changLed1Bool(bool value){
    setState(() {
      led1Bool=value;
      if(led1Bool){
        led1Int=1;
      }
      else{
        led1Int=0;
      }
      editDatabase();
    });
  }

  void changSw1Bool(bool value){
    setState(() {
      sw1Bool=value;
      if(sw1Bool){
        sw1Int=1;
      }
      else{
        sw1Int=0;
      }
      editDatabase();
    });
  }

  void changFan1Bool(bool value){
    setState(() {
      fan1Bool=value;
      if(fan1Bool){
        fan1Int=1;
      }
      else{
        fan1Int=0;
      }
      editDatabase();
    });
  }

  void changair1Bool(bool value){
    setState(() {
      air1Bool=value;
      if(air1Bool){
        air1Int=1;
      }
      else{
        air1Int=0;
      }
      editDatabase();
    });
  }

  Widget button(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchLed1(),
        switchSw1(),
      ],
    );
  }
  Widget button1(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        switchFan1(),
        switchAir1(),
      ],
    );
  }
  Widget textShow(){
    return Text(namestr,
    style: TextStyle(
      fontSize: 40.0,
      fontWeight:FontWeight.bold,
      color:Colors.pinkAccent
    ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome  '+namestr),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/wo.jpeg')),
        gradient: RadialGradient(
          colors:[Colors.white,Colors.limeAccent],
          radius: 2.0//กระจายสี
        )
      ),
      child: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        textShow(),Text('\n'),
        switchMode(),
        button(),
        button1(),
      ],
      ),),
      ),
      
    );
  }
}