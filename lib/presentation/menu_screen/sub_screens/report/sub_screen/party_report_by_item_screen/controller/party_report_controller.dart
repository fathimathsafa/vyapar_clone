import 'package:get/get.dart';

import '../../../../../../../core/common/loading_var.dart';
import '../../../../../../../core/isResponseOk.dart';
import '../../../../../../../repository/api/api_services/api_services.dart';
import '../../../../../../../repository/api/end_urls/end_url.dart';
import '../../../../../../../repository/app_data/user_data/shared_preferences.dart';
import '../../transaction/models/day_book_report_model.dart';

class PartyReportByItemsController extends GetxController {
  // Observable variables
  var selectedParty = 'All Categories'.obs;
  var selectedSort = 'Party name'.obs;

  List<String> partyTypes = ['All Categories', 'Uncategorized'];
  List<String> sortOptions = [
    'Party name',
    'Sale quantity',
    'Purchase quantity'
  ];

  // Method to change selected party
  void updateSelectedParty(String value) {
    selectedParty.value = value;
  }

  // Method to change selected sort option
  void updateSelectedSort(String value) {
    selectedSort.value = value;
  }



final ApiServices _apiServices = ApiServices();
  RxList<DayBookReportModel> dayBookReportList = <DayBookReportModel>[].obs;
 
  void fetchDayBookReportList() async {
    setLoadingValue(true);

    var response = await _apiServices.getRequest(
        endurl: EndUrl.getPartyReport(start:"2024-10-01",end: '2024-10-30' ),
        authToken: await SharedPreLocalStorage.getToken());
      //  printInfo(info: "response status code ==${response!.data}");
    if (response != null) {
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['TransactionList'];

        List<DayBookReportModel> units = List<DayBookReportModel>.from(
            jsonResponse.map((x) => DayBookReportModel.fromJson(x)));
        
          setLoadingValue(false);
        dayBookReportList.assignAll(units);
        // print("Item length==${itemList.length}");
        setLoadingValue(false);
      }
      setLoadingValue(false);
    }
    setLoadingValue(false);
  }
}
