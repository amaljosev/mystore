import 'dart:developer';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  @override
  void onInit() async{
    super.onInit();
    products=await getDatas(); 
  }
  List products=[];
  final url = "https://fakestoreapi.com/products";
  Future getDatas() async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final products = jsonDecode(response.body) as List;
        
        return products;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("exception found $e");
    }
  }
}

