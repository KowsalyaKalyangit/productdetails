import 'dart:developer';

 
import 'package:product/allpackages.dart';
import 'package:product/model/profile_edit_model.dart';
import 'package:product/service/proposal_edit_service.dart';
 

class ProposalEditController extends GetxController {
  List<ProposalEditModel> _proposalEdit = [];
  List<ProposalEditModel> get getproposalEdit => _proposalEdit;
  RxBool isproposalEditLoad = true.obs;
  ProposalEditService proposalEditService = ProposalEditService();
  TextEditingController subject = TextEditingController();
  TextEditingController toname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController tomail = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController oepntill = TextEditingController();
  TextEditingController leadname = TextEditingController();
  //...
  TextEditingController hoistwaysize = TextEditingController();
  TextEditingController carsize = TextEditingController();
  TextEditingController delivery = TextEditingController();
  TextEditingController eretionname = TextEditingController();
  TextEditingController powersupply = TextEditingController();

  RxString type = ''.obs;
   RxString load = ''.obs;
  RxString loadid = ''.obs;
  RxString speed = ''.obs;
  RxString travel = ''.obs;
  RxString operation = ''.obs;
  RxString control = ''.obs;
  RxString machine = ''.obs;
  RxString total = ''.obs;
  RxString subtotal = ''.obs;
      RxString typename= ''.obs;
    RxString specificationname= ''.obs;
     RxString specificationid= ''.obs;
     RxString passenger= ''.obs;
   RxString carenclosure= ''.obs;
    RxString hoistwaydoors= ''.obs;
     RxString entrance= ''.obs;
       RxString dooroperation= ''.obs;
        RxString speedid= ''.obs;
          RxString travelid= ''.obs;
           RxString stopid= ''.obs;
          RxString stopname= ''.obs;
             RxString openid= ''.obs;
          RxString openname= ''.obs;


  Future proposalEditController() async {
    isproposalEditLoad(true);
    try {
      var response =
          await proposalEditService.proposalEditService();
      log(response.toString());
      if (response != null) {
        _proposalEdit.add(response);

        subject.text = _proposalEdit[0].data[0].subject;
        leadname.text = _proposalEdit[0].data[0].lead;
        address.text = _proposalEdit[0].data[0].address;
        city.text = _proposalEdit[0].data[0].city;
        state.text = _proposalEdit[0].data[0].state;
        country.text = _proposalEdit[0].data[0].country;
        zip.text = _proposalEdit[0].data[0].zip;
        tomail.text = _proposalEdit[0].data[0].toemail;
        phone.text = _proposalEdit[0].data[0].phone;
        date.text =
            '${DateTime.parse(_proposalEdit[0].data[0].date.toString()).year.toString()}-${DateTime.parse(_proposalEdit[0].data[0].date.toString()).month.toString()}-${DateTime.parse(_proposalEdit[0].data[0].date.toString()).day}';
        // date.text = _getproposalrelated[0].data[0].date.toString();
        oepntill.text =
            '${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).year.toString()}-${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).month.toString()}-${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).day}';
        type.value = _proposalEdit[0].data[0].typeid;
          load.value = _proposalEdit[0].data[0].loadid;
        loadid.value = _proposalEdit[0].data[0].loadid;
           speedid.value = _proposalEdit[0].data[0].speedid;
        speed.value = _proposalEdit[0].data[0].speed;
        travel.value = _proposalEdit[0].data[0].travel;
          travelid.value = _proposalEdit[0].data[0].travelid;
        operation.value = _proposalEdit[0].data[0].operation;
        control.value = _proposalEdit[0].data[0].control;
        machine.value = _proposalEdit[0].data[0].machine;
        hoistwaysize.text = _proposalEdit[0].data[0].hoistwaysize;
        carsize.text = _proposalEdit[0].data[0].carsize;
        delivery.text = _proposalEdit[0].data[0].delivery;
        eretionname.text = _proposalEdit[0].data[0].erection;
        powersupply.text = _proposalEdit[0].data[0].powerSupply;
        specificationname.value=_proposalEdit[0].data[0].specification;
         specificationid.value=_proposalEdit[0].data[0].specificationid;
         typename.value=_proposalEdit[0].data[0].type;
         passenger.value=_proposalEdit[0].data[0].passenger;
           carenclosure.value=_proposalEdit[0].data[0].carenclosure;
         hoistwaydoors.value=_proposalEdit[0].data[0].hoistwaydoors;
         entrance.value=_proposalEdit[0].data[0].entrances;
          dooroperation.value=_proposalEdit[0].data[0].dooroperation;
           stopid.value=_proposalEdit[0].data[0].stopid;
            stopname.value=_proposalEdit[0].data[0].stop;
             openid.value=_proposalEdit[0].data[0].openingid;
            openname.value=_proposalEdit[0].data[0].opening;
             
        isproposalEditLoad(false);
      } else {
        isproposalEditLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
