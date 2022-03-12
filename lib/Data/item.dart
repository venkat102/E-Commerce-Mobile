import 'package:ecom/Data/api.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class GetItem extends GetxService {
  final Api api;
  GetItem({required this.api});

  Future<Response> getItemList() async {
    print("In Repo");
    return await api.getData("/api/method/ecom.api.item.get_item");
  }
}
