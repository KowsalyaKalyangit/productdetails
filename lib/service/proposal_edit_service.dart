import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';

 
import '../model/profile_edit_model.dart';

class ProposalEditService {
  Future proposalEditService() async {
    
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposaleditdata",
        "proposalid": 1.toString()
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
        return ProposalEditModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
