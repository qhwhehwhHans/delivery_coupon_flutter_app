import 'dart:html';

import 'package:delivery_coupon_app/dio_server.dart';
import 'package:delivery_coupon_app/list_item.dart';
import 'package:delivery_coupon_app/store.dart';
import 'package:delivery_coupon_app/store_manager.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Store> stores = List<Store>.empty();

  @override
  Widget build(BuildContext context) {
    server.getReq(update);
    if (stores.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("배달 어플 쿠폰 모아보기")),
        body: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          appBar: AppBar(title: Text("배달 어플 쿠폰 모아보기")),
          body: ListView.builder(
            //scrollDirection: Axis.vertical,
            //shrinkWrap: true,
            itemCount: stores.length,
            itemBuilder: (BuildContext context, int index) {
              return listItem(stores[index]);
            },)
      );
    }
  }

    update(List<Store> item) {
      setState(() {
        stores = item;
      });
    }
}
