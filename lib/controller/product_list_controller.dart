import '../allpackages.dart';

class ProductController extends GetxController {
  RxBool productLoad = true.obs;
  List<ProductListModel> _productlist = [];
  List<ProductListModel> get getproductlist => _productlist;
  var productService = ProductListService();
  var mrp=''.obs;
  Future productController() async {
    try {
      var response = await productService.productListService();
      if (response != null) {
        _productlist.add(response);
       

        //  
        productLoad(false);
      } else {
        productLoad(false);
      }
    } catch (e) {
      rethrow;
    }
  }
}
