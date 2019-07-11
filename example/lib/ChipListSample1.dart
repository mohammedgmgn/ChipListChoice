import 'package:chip_list_choice/ChipListChoice.dart';
import 'package:chip_list_choice/CheckBoxModel.dart';
import 'package:chip_list_choice/ChipListChoice.dart';
import 'package:flutter/material.dart';

import 'UserModel.dart';

class ChipListSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChipListSample1State();
  }
}

class ChipListSample1State extends State<ChipListSample1> {
  @override
  Widget build(BuildContext context) {
    return ChipListChoice(
        title: "Users",
        usersDataSet: users.toSet(),
        finalListResult: _finalBeneficiaryListSelection,
        color: Colors.cyan);
  }

  _finalBeneficiaryListSelection(dynamic finalSelectionResult) {
    print(finalSelectionResult.length.toString());
  }
}
