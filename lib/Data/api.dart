import 'package:get/get.dart';
import 'package:get/get_connect.dart';

class Api extends GetConnect implements GetxService {
  late String token;
  final String url;
  late Map _header;
  Api({required this.url}) {
    baseUrl = url;
    _header = {
      "content-type": "application/json; charset=utf-8",
      // "Authorization": "token $token"
    };
  }
  Future<Response> getData(
    String uri,
  ) async {
    try {
      print(uri);
      print(baseUrl);
      Response responce = await get(uri);
      print(responce.body);
      return responce;
    } catch (e) {
      return Response(statusCode: 001, statusText: e.toString());
    }
  }
}
