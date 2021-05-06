import 'dart:collection';

import 'package:delivery_coupon_app/store.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {

  final List<Store> stores;
  final Function togglePriceAscending;
  bool priceAscending;

  Filter(this.stores, this.priceAscending, this.togglePriceAscending);

  @override
  _FilterState createState() => _FilterState(stores, priceAscending, togglePriceAscending);
}

class _FilterState extends State<Filter> {

  final List<Store> stores;
  final Function togglePriceAscending;
  bool priceAscending;

  HashSet<String> appSet = HashSet();
  HashSet<String> categorySet = HashSet();
  List<String> appList = List<String>.empty();
  List<String> categoryList = List<String>.empty();

  _FilterState(this.stores, this.priceAscending, this.togglePriceAscending);

  @override
  void initState() {

    for(int i = 0; i < stores.length; ++i) {
      appSet.add(stores[i].app);
      categorySet.add(stores[i].category);
    }

    appList = appSet.toList();
    categoryList = categorySet.toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Text("앱 이름", textScaleFactor: 1.5,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(appList[index]),
                  trailing: Icon(Icons.check_box_outline_blank),
                  onTap: (){},
                );
              },
              itemCount: appList.length,
            ),
          ),
          Text("카테고리", textScaleFactor: 1.5,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(categoryList[index]),
                  trailing: Icon(Icons.check_box_outline_blank),
                  onTap: (){},
                );
              },
              itemCount: categoryList.length,
            ),
          ),
          ListTile(
            title: Text("가격"),
            trailing: priceAscending?Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down),
            onTap: (){
              togglePriceAscending();
              setState(() {
                priceAscending = !priceAscending;
              });
            },
          ),
        ],
      ),
    );
  }
}
