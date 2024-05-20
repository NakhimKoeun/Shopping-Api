import 'package:dio/dio.dart';
import 'package:shopapi/models/product_models.dart';

class Api {
  final dio = Dio();

  Future<List<ProductModels>> getProduct() async {
    try {
      final response = await dio.get("https://fakestoreapi.com/products");
      return (response.data as List)
          .map((e) => ProductModels.fromJson(e))
          .toList();
    } catch (e) {
      throw (e);
    }
  }
}
