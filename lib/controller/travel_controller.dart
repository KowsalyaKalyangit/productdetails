import 'dart:developer';

import 'package:product/allpackages.dart';
import 'package:product/model/travel_amount_model.dart';
import 'package:product/model/travel_model.dart';
import 'package:product/service/travel_amt_service.dart';

import '../service/travel_service.dart';

 

class ProposalTravelController extends GetxController {
  List<ProposalTravelModel> _proposaltravel = [];
  List<ProposalTravelModel> get getproposalTravel => _proposaltravel;
  RxBool isproposaltravelLoad = true.obs;
  ProposalTravelService proposalTravelService = ProposalTravelService();
  //
  List<ProposalTravelAmtModel> _proposaltravelamt = [];
  List<ProposalTravelAmtModel> get getproposaltravelamt => _proposaltravelamt;
  RxBool isproposltravelamtLoad = true.obs;
  ProposalTravelAmountService proposalTravelAmountService =
      ProposalTravelAmountService();
  Future proposalTravelController() async {
    isproposaltravelLoad(true);
    try {
      var response = await proposalTravelService.proposalTravelService();
      log(response.toString());
      if (response != null) {
        _proposaltravel.clear();
        print('res---------------$response');
        _proposaltravel.add(response);

        isproposaltravelLoad(false);
      } else {
        isproposaltravelLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  ////
   Future proposaltravelAmtController({travelid, specid, total, subtotal}) async {
    isproposltravelamtLoad(true);
    try {
      var response =
          await proposalTravelAmountService.proposalTravelAmountService(
              travelid: travelid,
              specid: specid,
              total: total,
              subtotal: subtotal);
      log(response.toString());
      if (response != null) {
        _proposaltravelamt.clear();
        print('res---------------$response');
        _proposaltravelamt.add(response);
 
        isproposltravelamtLoad(false);
      } else {
        isproposltravelamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
