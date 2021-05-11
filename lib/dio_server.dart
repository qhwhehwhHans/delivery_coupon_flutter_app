import 'package:delivery_coupon_app/store.dart';
import 'package:delivery_coupon_app/store_manager.dart';
import 'package:dio/dio.dart';

const _API_PREFIX = "http://test.deliverycoupon.life:8080/getData";

class Server {
  Future<void> getReq(Function(List<Store> item) initList) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(_API_PREFIX,
                            options: Options(
                              responseType: ResponseType.plain,
                            ),);
    storeManager.jsonToStore(response.data.toString());
    initList(storeManager.stores);
  }
}

Server server = Server();