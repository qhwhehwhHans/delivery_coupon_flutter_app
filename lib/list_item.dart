import 'package:delivery_coupon_app/store.dart';
import 'package:flutter/material.dart';

class listItem extends StatelessWidget {

  final Store store;

  listItem(this.store);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Column(
            children: [
              Text("<"+store.app+">"),
              Text(store.name, textScaleFactor: 2.0,),
              Text(store.discount.toString()+"원 할인"),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
