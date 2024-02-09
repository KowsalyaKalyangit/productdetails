import 'dart:developer';

import 'package:product/allpackages.dart';
import 'package:product/model/proposal_stop_model.dart';
import 'package:product/service/proposal_open_service.dart';
import 'package:product/service/proposal_stop_service.dart';

import '../model/proposal_open_model.dart';

 

class ProposalStopOpenController extends GetxController {
  List<ProposalStopModel> _proposalstop = [];
  List<ProposalStopModel> get getproposalStop => _proposalstop;
  RxBool isproposalStopLoad = true.obs;
  ProposalStopService proposalStopService = ProposalStopService();
  //
   List<ProposalOpenModel> _proposalOpen = [];
  List<ProposalOpenModel> get getproposalOpen => _proposalOpen;
  RxBool isproposalOpenLoad = true.obs;
  ProposalOpeningService proposalOpeningService = ProposalOpeningService();
  Future proposalStopController() async {
    isproposalStopLoad(true);
    try {
      var response = await proposalStopService.proposalStopService();
      log(response.toString());
      if (response != null) {
        _proposalstop.clear();
        print('res---------------$response');
        _proposalstop.add(response);

        isproposalStopLoad(false);
      } else {
        isproposalStopLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }


   Future proposalOpenController() async {
    isproposalOpenLoad(true);
    try {
      var response = await proposalOpeningService.proposalOpeningService();
      log(response.toString());
      if (response != null) {
        _proposalOpen.clear();
        print('res---------------$response');
        _proposalOpen.add(response);

        isproposalOpenLoad(false);
      } else {
        isproposalOpenLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
