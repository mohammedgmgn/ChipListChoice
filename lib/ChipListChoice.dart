import 'package:flutter/material.dart';

import 'CheckBoxModel.dart';
import 'CustomCheckBox.dart';

class ChipListChoice<T extends CheckBoxModel> extends StatefulWidget {
  final Set<T> usersDataSet;
  final String title;
  final Color color;
  final Function finalListResult;

  const ChipListChoice(
      {Key key,
        this.title,
        this.usersDataSet,
        this.finalListResult,
        this.color = Colors.cyan})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChipListChoiceState<T>();
  }
}

class ChipListChoiceState <T extends CheckBoxModel> extends State<ChipListChoice>
    implements CheckChangesListenerWithData {
  Set<T> selectedUsers = Set();
  List<T> data = [];

  @override
  void initState() {
    super.initState();
    selectedUsers=widget.usersDataSet;
    data=widget.usersDataSet.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 200),
        child: Center(child: getAddChipWidget()));
  }

  Widget getAddChipWidget() {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(widget.title),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.add,
                  color: widget.color,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: getChips(selectedUsers),
        )
      ],
    );
  }

  Widget getChips(Set<T> users) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: users
              .where((user) => user.isChecked)
              .map((user) => Padding(
              padding: EdgeInsets.all(3.0),
              child: Chip(
                onDeleted: () {
                  setState(() {
                    user.isChecked = false;
                    var result=_getFinalList(users.toList());
                    widget.finalListResult(result);
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

  Widget getLookUpWidget(T user) {
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

  Widget getCheckBox(T user) {
    return CustomCheckBox(
        checked: user.isChecked,
        changesListenerWithData: this,
        width: 25,
        data: user);
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 500.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return getLookUpWidget(data[index]);
        },
      ),
    );
  }

  _showUsersList() async {
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
                    onPressed: () {
                     var result= _getFinalList(selectedUsers.toList());
                      widget.finalListResult(result);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: widget.color,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _clearData(data);
                          selectedUsers.clear();
                          widget.finalListResult(selectedUsers.toList());
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: widget.color,
                    ),
                  )
                ],
              ),
            ],
            content: setupAlertDialoadContainer(),
          );
        });
    setState(() {});
  }

  @override
  void onCheckChangesListener(bool check, item) {
    item.isChecked = check;
    if (check) {
      selectedUsers.add(item);
    } else {
      selectedUsers.remove(item);
    }
  }

  void _clearData(List<T> data) {
    data.forEach((element) {
      element.isChecked = false;
    });
  }

  List<T>  _getFinalList(List<T> list) {
    List<T> result=[];

    list.forEach((element) {
      if(element.isChecked){
        result.add(element);
      }
    });
    return result;
  }
}
