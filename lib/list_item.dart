import 'package:delivery_coupon_app/store.dart';
import 'package:flutter/material.dart';

class listItem extends StatelessWidget {

  final Store store;

  listItem(this.store);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("<"+store.app+">"),
            SizedBox(height: 10,),
            Text(store.name, textScaleFactor: 2.0,),
            Text(
              store.discount.toString()+"원 할인",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 17,
              ),
            ),
            Text(
              store.minimunPrice!=0?"최소주문금액: "+store.minimunPrice.toString()+"원":"최소주문금액: 없음",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              store.content.toString(),
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      onTap: (){},
    );
  }
}
