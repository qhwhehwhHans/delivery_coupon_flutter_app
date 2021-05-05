import 'package:delivery_coupon_app/store_manager.dart';
import 'package:dio/dio.dart';

const _API_PREFIX = "http://127.0.0.1:8080/getData";

class Server {
  Future<void> getReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(_API_PREFIX,
                            options: Options(
                              responseType: ResponseType.plain,
                            ),);
    storeManager.jsonToStore(response.data.toString());
  }
}

Server server = Server();