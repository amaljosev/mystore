import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:storeapp/controller/api_controller.dart';

class ScreenProduct extends StatelessWidget { 
  const ScreenProduct({super.key, required this.index});
  final  int index; 

  @override
  Widget build(BuildContext context) {
    final apiCtrl=Get.find<ApiController>();
    return  Scaffold(
      appBar: AppBar(
        title:  Text(apiCtrl.products[index]['category']), 
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [ 
                Expanded(child: Text(apiCtrl.products[index]['title']))  
              ],
            ),
          ),
          Container(
            height: 200,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(apiCtrl.products[index]['image']),fit: BoxFit.contain)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [ 
                Expanded(child: Text("Price: ${apiCtrl.products[index]['price']}"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [ 
                Expanded(child: Text(apiCtrl.products[index]['description']))
              ],
            ),
          )
        ],
      ),
    );
  }
}