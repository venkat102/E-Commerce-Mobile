import 'package:ecom/Controllers/item_list_controller.dart';
import 'package:ecom/Data/api.dart';
import 'package:get/get.dart';

import '../Data/item.dart';

Future<void> init() async {
  //API
  print('init');
  print("Api");
  Get.lazyPut(() => Api(url: "https://10.0.2.2:8000"));
  //Repo
  print("Repo");
  Get.lazyPut(() => GetItem(api: Get.find()));
  //Controller
  print("Controller");
  Get.lazyPut(() => ItemListController(getItem: Get.find()));
}
