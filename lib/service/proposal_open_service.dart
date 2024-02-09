import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';

 
import '../model/proposal_open_model.dart';

class ProposalOpeningService {
  Future proposalOpeningService({dashboard}) async {
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getliftopening",
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
        return ProposalOpenModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
