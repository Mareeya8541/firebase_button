import 'package:flutter/material.dart';

class IotModel{
  int led1,mode,sw1,fan1,air1;
  String namestr,namewel;

  IotModel(
    this.led1,this.mode,this.air1,this.fan1,this.sw1,this.namestr,this.namewel
  );

    IotModel.formMap(Map<dynamic,dynamic>map){
      mode = map['mode'];
      led1 = map['led1'];
      sw1=map['sw1'];
      fan1=map['fan1'];
      air1=map['air1'];
      namestr=map['namestr'];
      namewel=map['namewel'];
      
    }

    Map<dynamic,dynamic> toMap(){
      final Map<dynamic,dynamic> map = Map<dynamic,dynamic>();
      map['led1']=led1;
      map['mode']=mode;
      map['sw1']=sw1;
      map['fan1']=fan1;
      map['air1']=air1;
      map['namestr']=namestr;
      map['namewel']=namewel;


      return map;
    }
}