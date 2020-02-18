import 'package:flutter/material.dart';

class IotModel{
  int led1,mode,sw1,fan1,air1;

  IotModel(
    this.led1,this.mode,this.air1,this.fan1,this.sw1
  );

    IotModel.formMap(Map<dynamic,dynamic>map){
      mode = map['mode'];
      led1 = map['led1'];
      sw1=map['sw1'];
      fan1=map['fan1'];
      air1=map['air1'];
      
    }

    Map<dynamic,dynamic> toMap(){
      final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
      map['led1']=led1;
      map['mode']=mode;
      map['sw1']=sw1;
      map['fan1']=fan1;
      map['air1']=air1;


      return map;
    }
}