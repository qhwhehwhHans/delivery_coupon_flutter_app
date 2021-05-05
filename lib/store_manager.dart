import 'package:delivery_coupon_app/store.dart';
import 'dart:convert';

class StoreManager {
  List<Store> stores = List<Store>.empty();

  jsonToStore(String json) {
    final parsed = jsonDecode(json).cast<Map<String,dynamic>>();
    stores = parsed.map<Store>((json) => Store.fromJson(json)).toList();
    for(int i = 0; i < stores.length; ++i) {
      print(stores[i]);
    }
  }
}

StoreManager storeManager = StoreManager();