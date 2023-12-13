import 'dart:developer';

import 'package:http/http.dart' as http;

import '../allpackages.dart';

class ProductListService {
  Future productListService() async {
    var data = {"Cat": "FNV", "StoreId": "1", "User_id": "1", "R_Number": "1"};

    try {
      var response = await http.post(Uri.parse(Urls.productlist), body: data);
      log(data.toString());
      var jsonresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        log('kkkkk');
        log(response.body);
        return ProductListModel.fromJson(jsonresponse);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
