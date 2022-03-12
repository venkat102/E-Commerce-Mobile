import 'package:ecom/models/item_list.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Data/item.dart';

class ItemListController extends GetxController {
  final GetItem getItem;

  ItemListController({required this.getItem});
  List<dynamic> _item_list = [];
  List<dynamic> get item_list => _item_list;

  Future<void> getItemDetailsList() async {
    Response response = await getItem.getItemList();
    if (response.statusCode == 200) {
      _item_list = [];
      print(response);
      // _item_list.addAll(ItemList.fromJson(response.body.message).items);
      update();
    } else {}
  }
}
