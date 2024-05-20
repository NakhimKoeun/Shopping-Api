import 'package:get/get.dart';
import 'package:shopapi/models/product_models.dart';
import 'package:shopapi/service/API.dart';

class ProductController extends GetxController {
  final Api api = Api();
  bool Isloading = false;
  List<ProductModels> productmodels = [];
  List<ProductModels> get products => productmodels;
  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    getProduct();
  }

  Future refreshProduct() async {
    getProduct();
    return true;
  }

  void getProduct() async {
    try {
      Isloading = true;
      update();
      final product = await api.getProduct();
      productmodels = product;
      Isloading = false;
      update();
    } catch (e) {
      Isloading = false;
      update();
      throw (e);
    }
  }
}
