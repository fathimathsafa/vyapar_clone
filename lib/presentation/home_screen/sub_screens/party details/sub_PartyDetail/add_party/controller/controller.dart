import 'package:get/get.dart';
import 'package:vyapar_clone/model/add_party_model.dart';
import 'package:vyapar_clone/service/add_party_service.dart';

class AddPartyController extends GetxController {
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

  var isPartyNameFilled = false.obs;
  var selectedDate = "".obs;

  final PartyService _partyService = PartyService();

  void addNewParty({
    required String name,
    required String gstIn,
    required String gstType,
    required String email,
    required String phone,
    required String state,
    required String billingAddress,
    required String shippingAddress,
    required double openingBalance,
    required String asOfDate,
    required String balanceType,
  }) {
    final Party newParty = Party(
      name: name,
      gstIn: gstIn,
      gstType: gstType,
      email: email,
      phone: phone,
      state: state,
      billingAddress: billingAddress,
      shippingAddress: shippingAddress,
      openingBalance: openingBalance,
      asOfDate: asOfDate,
      balanceType: balanceType,
      additionalField1: '',
      additionalField2: '',
      additionalField3: '',
    );

    _partyService.addParty(newParty);
  }
}
