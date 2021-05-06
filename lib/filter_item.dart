import 'package:flutter/material.dart';

class filterItem extends StatefulWidget {

  final String str;
  final Function editFiliter;

  filterItem(this.str, this.editFiliter);

  @override
  _filterItemState createState() => _filterItemState(str, editFiliter);
}

class _filterItemState extends State<filterItem> {

  final String str;
  final Function editFiliter;

  _filterItemState(this.str, this.editFiliter);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(str),
      trailing: editFiliter(str,2) == 0 ? Icon(Icons.check_box_outline_blank) : Icon(Icons.check_box_outlined, color: Colors.redAccent,),
      onTap: (){
        setState(() {
          if(editFiliter(str,2) == 1) {
            editFiliter(str,1);
          } else {
            editFiliter(str,0);
          }
        });
      },
    );;
  }
}
