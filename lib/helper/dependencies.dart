import 'package:ecom/Controllers/item_list_controller.dart';
import 'package:ecom/Data/api.dart';
import 'package:ecom/utils/app_consants.dart';
import 'package:get/get.dart';

import '../Data/item.dart';

Future<void> init() async {
  //API
  Get.lazyPut(() => Api(url: AppConstant.BASE_URL));
  //Repo
  Get.lazyPut(() => GetItem(api: Get.find()));
  //Controller
  Get.lazyPut(() => ItemListController(getItem: Get.find()));
}
