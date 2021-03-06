import 'dart:collection';

import 'package:delivery_coupon_app/dio_server.dart';
import 'package:delivery_coupon_app/filter.dart';
import 'package:delivery_coupon_app/chrome_list_item.dart';
import 'package:delivery_coupon_app/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'android_list_item.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Store> stores = [];
  List<Store> displayStores;
  HashSet<String> appFilter = HashSet();
  HashSet<String> categoryFilter = HashSet();
  bool priceAscending = true;
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    server.getReq(initList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("배달 어플 쿠폰 모아보기")),
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("배달 어플 쿠폰 모아보기"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings_sharp),
              onPressed: (){
                if(_drawerscaffoldkey.currentState.isDrawerOpen){
                  Navigator.pop(context);
                } else {
                  _drawerscaffoldkey.currentState.openDrawer();
                }
              },
            ),
          ),
        ),
        body: Scaffold(
          key: _drawerscaffoldkey,
          drawer: Filter(stores, togglePriceAscending, editAppFiliter, editCategoryFiliter, priceAscending),
          body: GridView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: displayStores.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: foundation.defaultTargetPlatform == foundation.TargetPlatform.android ? 1 : 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: (MediaQuery.of(context).size.height * 0.0025),
            ),
            itemBuilder: (BuildContext context, int index) {
              return foundation.defaultTargetPlatform == foundation.TargetPlatform.android ? androidListItem(displayStores[index]) : chromeListItem(displayStores[index]);
            },
          ),
        ),
      );
    }
  }

  initList(List<Store> item) {
    setState(() {
      stores = item;
      useFiliter(stores);
      sortPrice();
    });
  }
  useFiliter(List<Store> item) {
    displayStores=[];
    for(int i = 0; i < item.length; ++i) {
      if(appFilter.length == 0 || appFilter.contains(item[i].app)) {
        if(categoryFilter.length == 0 || categoryFilter.contains(item[i].category)) {
          displayStores.add(item[i]);
        }
      }
    }
  }

  editAppFiliter(String item, int type) {
    int returnValue = -1;
    if (type == 0) { //add,
      appFilter.add(item);
      updateItem();
    } else if (type == 1) { //remove
      appFilter.remove(item);
      updateItem();
    } else if (type == 2) { //get
      returnValue = appFilter.contains(item) ? 1 : 0;
    }
    return returnValue;
  }
  editCategoryFiliter(String item, int type) {
    int returnValue = -1;
    if (type == 0) { //add,
      categoryFilter.add(item);
      updateItem();
    } else if (type == 1) { //remove
      categoryFilter.remove(item);
      updateItem();
    } else if (type == 2) { //get
      returnValue = categoryFilter.contains(item) ? 1 : 0;
    }
    return returnValue;
  }

  togglePriceAscending() {
    setState(() {
      priceAscending = !priceAscending;
      updateItem();
    });
  }
  sortPrice(){
    if (priceAscending) {
      displayStores.sort((a, b){
        if(a.discount > b.discount)
          return 1;
        return -1;
      });
    } else {
      displayStores.sort((a, b){
        if(a.discount < b.discount)
          return 1;
        return -1;
      });
    }
  }
  updateItem() {
    setState(() {
      useFiliter(stores);
      sortPrice();
    });
  }
}
