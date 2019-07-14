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
    return ChipListChoice<User>(
        title: "Users",
        usersDataSet: users.toSet(),
        finalListResult: _finalListSelection,
        color: Colors.cyan);
  }

  _finalListSelection(List<User> finalSelectionResult) {
    print(finalSelectionResult.length.toString());
  }
}

List<User> users = [
  User(name: "Mohammed"),
  User(name: "Mahmoud"),
  User(name: "Karim"),
  User(name: "eman"),
  User(name: "osama"),
  User(name: "mohsen"),
  User(name: "Mostafa"),
  User(name: "Abdullaha"),
  User(name: "Ibrahim"),
];