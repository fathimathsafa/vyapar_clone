import 'package:get/get.dart';

class AddPartyController extends GetxController{



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
}