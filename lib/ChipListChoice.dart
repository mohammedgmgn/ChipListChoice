import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'AddChipList.dart';
import 'CheckBoxModel.dart';

class ChipListChoice {

  static const MethodChannel _channel =
      const MethodChannel('chip_list_choice');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Widget getAddChipList({Set<CheckBoxModel> usersDataSet,String title,Color color,Function finalListResult}){

    return AddChipList(title: title,usersDataSet: usersDataSet,color: color,finalListResult: finalListResult,);
  }
}
