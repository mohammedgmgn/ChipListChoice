class CheckBoxModel {
  bool isChecked;
  String title;
  String id;
  int tableId;

  CheckBoxModel(this.title,{this.isChecked = false, this.id, this.tableId});

  CheckBoxModel.initial()
      : title = '',
        isChecked = false,
        id = "";
}
