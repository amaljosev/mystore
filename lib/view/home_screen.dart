import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeapp/controller/api_controller.dart';
import 'package:storeapp/view/product_detail_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final apiCtrl=Get.put(ApiController()); 
    return  Scaffold(
      appBar: AppBar( 
        title: const Text('My Store'), 
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return  ListTile(
          leading:Text(apiCtrl.products[index]['id'].toString()),   
          title: Text(apiCtrl.products[index]['title']), 
          subtitle: Text("Price: ${apiCtrl.products[index]['price']}"),  
          onTap: () => Get.to(ScreenProduct(index:index)),
        );
      },itemCount: apiCtrl.products.length),
    ); 
  }
}