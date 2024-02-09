import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:product/model/travel_amount_model.dart';

import '../../allpackages.dart';

 

class ProposalTravelAmountService {
  Future proposalTravelAmountService({travelid,specid,subtotal,total}) async {
  
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposaltravelvalue",
        "travelid": travelid??'',
        "specid":specid??'',
        "subtotal": subtotal??'',
        "total": total??''
      };
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse('https://cherritech.us/proelevators/api/getDetails.php'), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonresponse['message']);
        return ProposalTravelAmtModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
