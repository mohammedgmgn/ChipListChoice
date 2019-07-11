import 'package:chip_list_choice/CheckBoxModel.dart';

class User extends CheckBoxModel {
  final String name;

  User({this.name}) {
    this.title = name;
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
