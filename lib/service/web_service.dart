import 'dart:convert';
import 'package:fively_ecommerce/model/product.dart';
import 'package:http/http.dart' as http;

class WebService {
  static Future<List<Product>> getProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products'
        // 'https://api.escuelajs.co/api/v1/categories/2/products'
        );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception(
          'Request failed with the status code ${response.statusCode}');
    }
  }
}
