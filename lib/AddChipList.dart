import 'package:flutter/material.dart';

import 'CheckBoxModel.dart';
import 'CustomCheckBox.dart';

class AddChipList extends StatefulWidget {
  final Set<CheckBoxModel> usersDataSet;
  final String title;
  final Color color;
  final Function finalListResult;
  const AddChipList({Key key, this.title,this.usersDataSet, this.finalListResult, this.color=Colors.cyan}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return  AddChipListState();
  }
}

class AddChipListState extends State<AddChipList> implements CheckChangesListenerWithData {
  Set<CheckBoxModel> selectedUsers = Set();
 List <CheckBoxModel>data=[];
  @override
  void initState() {
    super.initState();

    data.addAll(widget.usersDataSet);
    selectedUsers.addAll(widget.usersDataSet);
  }

  @override
  Widget build(BuildContext context) {
    return getAddChepWidget();
  }

  Widget getAddChepWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _showUsersList();

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.title),
              Icon(Icons.add,color: widget.color,)
            ],

          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: getChips(selectedUsers),
        )


        // SizedBox(height: 30.0),
      ],
    );

  }

  Widget getChips(Set<CheckBoxModel> users) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: users.where((user)=>user.isChecked)
              .map((user) => Padding(
              padding: EdgeInsets.all(3.0),
              child: Chip(
                onDeleted: () {
                  setState(() {
                   // selectedUsers.remove(user);
                    user.isChecked=false;
                    widget.finalListResult(selectedUsers);
                    //  bloc.removeLookUp(type, lookUp);
                  });
                },
                deleteIcon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20.0,
                ),
                deleteIconColor: Colors.white,
                label: Text(
                  user.title,
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.all(5.0),
                backgroundColor: widget.color,
              )))
              .toList(),
        ));
  }

  Widget getLookUpWidget(CheckBoxModel user) {
    return Container(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Text(
                    user.title,
                    style: TextStyle(color: Colors.black),
                  )),
              getCheckBox(user)
            ],
          ),
        ));
  }

  Widget getCheckBox(CheckBoxModel user) {
    return CustomCheckBox(
        color: user.isChecked ? widget.color : Colors.grey,
        checked: user.isChecked,
        changesListenerWithData: this,
        width: 25,
        data: user);
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 500.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child:  ListView.builder(
        shrinkWrap: true,
        itemCount:data.length,
        itemBuilder: (BuildContext context, int index) {
          return getLookUpWidget(data[index]);

        },
      ),
    );
  }
  _showUsersList() async{
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text(widget.title)),
            contentTextStyle: TextStyle(fontWeight: FontWeight.bold),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      widget.finalListResult(selectedUsers);
                      Navigator.pop(context);

                    },child: Text("Save",style: TextStyle(color: Colors.white),),
                    color: widget.color,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(onPressed: (){
                      setState(() {
                      //  selectedUsers=data.toSet();
                        _clearData(data);
                        selectedUsers.clear();
                        widget.finalListResult(selectedUsers);
                        Navigator.pop(context);

                      });
/*
                      Navigator.pop(context);
                      widget.finalListResult(widget.usersDataSet);
                      Navigator.pop(context);
*/



                    },child: Text("Cancel",style: TextStyle(color: Colors.white),),
                      color: widget.color,
                    ),
                  )
                ],
              ),
            ],
            content: setupAlertDialoadContainer(),

          );
        });
    setState(() {

    });
  }

  @override
  void onCheckChangesListener(bool check, item) {
    item.isChecked=check;
    if (check) {
      selectedUsers.add(item);
    } else {
      selectedUsers.remove(item);
    }  }

  void _clearData(List<CheckBoxModel> data) {
    data.forEach((element){
      element.isChecked=false;
    });
  }


}
/*
List<User> users = [
  User(name: "Mohammed", isChecked: false),
  User(name: "Ahmed", isChecked: false),
  User(name: "Mahmoud", isChecked: false),
  User(name: "Ibrahim", isChecked: false),
  User(name: "essam", isChecked: false),
  User(name: "ayoup", isChecked: false),
  User(name: "bola", isChecked: false),
  User(name: "salah", isChecked: false),
  User(name: "mohsen", isChecked: false),
  User(name: "eman", isChecked: false),
  User(name: "sara", isChecked: false),
  User(name: "mahmoud", isChecked: false),
  User(name: "Ibrahim", isChecked: false),

];


class User {
  bool isChecked;
  String name;

  User({this.isChecked = false, this.name});
}
*/