import 'dart:collection';
import 'dart:html';

import 'package:delivery_coupon_app/dio_server.dart';
import 'package:delivery_coupon_app/filter.dart';
import 'package:delivery_coupon_app/list_item.dart';
import 'package:delivery_coupon_app/store.dart';
import 'package:delivery_coupon_app/store_manager.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Store> stores = [];
  HashSet<String> filter = HashSet();
  bool priceAscending = true;

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
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: stores.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return listItem(stores[index]);
                  },),
              ),
            ],
          ),
          drawer: Filter(stores),
      );
    }
  }

  initList(List<Store> item) {
    setState(() {
      if (filter.length == 0) {
        for(int i = 0; i < item.length; ++i) {
          stores.add(item[i]);
        }
      } else {
        for(int i = 0; i < item.length; ++i) {
          if(filter.contains(item[i].app)||filter.contains(item[i].category)) {
            stores.add(item[i]);
          }
        }
      }
      if (priceAscending) {
        stores.sort((a, b){
          if(a.discount > b.discount)
            return 1;
          return -1;
        });
      } else {
        stores.sort((a, b){
          if(a.discount < b.discount)
            return 1;
          return -1;
        });
      }
    });
  }
}
