import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';
import 'package:vyapar_clone/model/party_model.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';

import '../../../../../../../core/common/context_provider.dart';
import '../../../../../../../core/common/loading_var.dart';
import '../../../../../../../core/isResponseOk.dart';
import '../../../../../../../core/models/credential_model.dart';
import '../../../../../../../repository/api/api_services/api_services.dart';
import '../../../../../../../repository/api/end_urls/end_url.dart';
import '../../../../../../../repository/app_data/user_data/shared_preferences.dart';

class AddPartyController extends GetxController{

final ContextProvider _contextProvider = ContextProvider();
  final ApiServices _apiServices = ApiServices();

  RxBool gstinToggle = true.obs; 
  RxBool partyShipToggle = true.obs; 
  RxBool partyGroupingToggle = false.obs;
  RxBool inviteToggle = false.obs;
  RxBool isExpanded = false.obs; // State to track if dropdown is open
  Map<String, bool> additionalFields = {
    "Additional Field 1": false,
    "Additional Field 2": false,
    "Additional Field 3": false,
    "Date Field": false,
  }.obs;

  final pNameController = TextEditingController();
  final pGstinController = TextEditingController();
 bool validateParty(){
  if(pNameController.text.isEmpty){
    SnackBars.showErrorSnackBar(text: "Please enter party name");
    return false;
  }else if(pGstinController.text.isEmpty){
    SnackBars.showErrorSnackBar(text: "Please enter GSTIN");
    return false;
  }else{
    return true;
  }
 }

  void addParty() async {
    CredentialModel credentialModel = await SharedPreLocalStorage.getCredential();
    setLoadingValue(true);

    var data = {
    "name": pNameController.text,
    "gstIn": pNameController.text,
    "gstType": "Unregistered/Consumer",
    "email": "",
    "phone": credentialModel.phoneNo,
    "state":"66f79f10dcfcf7f3a6fc5019",
    "billingAddress":"",
    "shippingAddress":"",
    "openingBalance":1,
    "asOfDate":"",
    "balanceType":"toPay",
    "additionalField1":"",
    "additionalField2":"",
    "additionalField3":""
};
    var response =
        await _apiServices.postJsonData(data: data, endUrl: EndUrl.addParty,authToken:credentialModel.token );
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
       
           var hC = Get.find<HomeController>();
           hC.getAllParty();

        setLoadingValue(false);
        Get.back();
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }


}