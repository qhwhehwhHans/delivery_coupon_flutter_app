import 'package:delivery_coupon_app/store.dart';
import 'package:flutter/material.dart';

class chromeListItem extends StatefulWidget {

  final Store store;

  chromeListItem(this.store);

  @override
  _chromeListItem createState() => _chromeListItem();
}

class _chromeListItem extends State<chromeListItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("<"+widget.store.app+">"),
            SizedBox(height: 7,),
            Text(widget.store.name, textScaleFactor: 1.0,),
            /*Text(
              widget.store.discount.toString()+"원 할인",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 17,
              ),
            ),
            Text(
              widget.store.minimunPrice!=0?"최소주문금액: "+widget.store.minimunPrice.toString()+"원":"최소주문금액: 없음",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 7,),
            Text(
              widget.store.content.toString(),
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 7,),
            isChecked?Icon(Icons.favorite, color: Colors.red,):Icon(Icons.favorite_border),*/
          ],
        ),
      ),
      onTap: (){
        setState(() {
          isChecked=!isChecked;
        });
      },
    );
  }
}
