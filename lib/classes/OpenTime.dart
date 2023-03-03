

import 'dart:core';

import 'package:flutter/material.dart';

class OpenTime {
  final TimeOfDay openHour ;
  final TimeOfDay closeHour ;

  OpenTime(this.closeHour, this.openHour);
  @override
  String toString(){
    return this.openHour.toString() + this.closeHour.toString() ;
  }
}