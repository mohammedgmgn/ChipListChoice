import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'AddChipList.dart';
import 'CheckBoxModel.dart';

class ChipListChoice {


  static Widget getAddChipList({Set<CheckBoxModel> usersDataSet,String title,Color color,Function finalListResult}){

    return AddChipList(title: title,usersDataSet: usersDataSet,color: color,finalListResult: finalListResult,);
  }
}
