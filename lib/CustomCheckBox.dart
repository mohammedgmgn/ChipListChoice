import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CustomCheckBox<T> extends StatefulWidget {
  bool checked;
  final CheckChangesListenerWithData changesListenerWithData;
  final CheckChangesListenerWithoutData checkChangesWithoutData;
  Color color;
  T data;
  double width;
  double hight;

  CustomCheckBox({@required this.checked,
    this.changesListenerWithData,
    this.color,
    this.data,
    this.checkChangesWithoutData, this.width, this.hight});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Container(
            width: widget.width,
            color: widget.color,
            child: Icon(widget.checked ? Icons.check_box : Icons
                .check_box_outline_blank)),
        /*Image.asset(
          width: widget.width,
          color: widget.color,
        )*/
        onPressed: ()
    {
      setState(() {
        widget.checked = !widget.checked;
        widget.data != null && widget.changesListenerWithData != null
            ? widget.changesListenerWithData
            .onCheckChangesListener(widget.checked, widget.data)
            : widget.checkChangesWithoutData
            .onCheckChangesListener(widget.checked);
      });
    });
  }

  void setChecked(bool check) {
    setState(() {
      widget.checked = check;
    });
  }

  bool isChecked() {
    return widget.checked;
  }

}

abstract class CheckChangesListenerWithData<T> {
  void onCheckChangesListener(bool check, T item);
}

abstract class CheckChangesListenerWithoutData {
  void onCheckChangesListener(bool check);
}
