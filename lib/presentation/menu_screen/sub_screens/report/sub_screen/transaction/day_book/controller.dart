import 'package:get/get.dart';

import '../../../../../../../core/common/loading_var.dart';
import '../../../../../../../core/isResponseOk.dart';
import '../../../../../../../repository/api/api_services/api_services.dart';
import '../../../../../../../repository/api/end_urls/end_url.dart';
import '../../../../../../../repository/app_data/user_data/shared_preferences.dart';
import '../models/day_book_report_model.dart';

class DayBookController extends GetxController{

final ApiServices _apiServices = ApiServices();
  RxList<DayBookReportModel> dayBookReportList = <DayBookReportModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchDayBookReportList();
  }
  void fetchDayBookReportList() async {
    setLoadingValue(true);

    var response = await _apiServices.getRequest(
        endurl: EndUrl.getDayBookReport(start: "2024-10-29"),
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