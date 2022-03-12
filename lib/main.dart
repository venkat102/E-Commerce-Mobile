import 'package:ecom/Controllers/item_list_controller.dart';
import 'package:ecom/pages/home/main_page.dart';
import 'package:ecom/pages/item_description/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecom/helper/dependencies.dart' as dep;

Future<void> main() async {
  print("1");
  WidgetsFlutterBinding.ensureInitialized();
  print('2');
  await dep.init();
  print('3');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<ItemListController>().getItemDetailsList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemDetails(),
    );
  }
}
