import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("Filter"),
          ),
          ListTile(
            title: Text("Hello"),
          ),
          ListTile(
            title: Text("World"),
          ),
        ],
      ),
    );
  }
}
