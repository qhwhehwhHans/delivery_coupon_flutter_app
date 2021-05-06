import 'package:flutter/material.dart';

class filterItem extends StatefulWidget {

  final String str;
  filterItem(this.str);

  @override
  _filterItemState createState() => _filterItemState(str);
}

class _filterItemState extends State<filterItem> {

  final String str;
  _filterItemState(this.str);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(str),
      trailing: Icon(Icons.check_box_outline_blank),
      onTap: (){},
    );;
  }
}
