import 'package:delivery_coupon_app/dio_server.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("배달 어플 쿠폰 모아보기")),
      body: Column(
        children: [
          ListView.builder(itemBuilder: (BuildContext context, int index){
            return Text("hans");
          }, itemCount: 20,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,),
          FloatingActionButton(onPressed: (){ server.getReq(); })
        ],
      )
    );
  }
}
