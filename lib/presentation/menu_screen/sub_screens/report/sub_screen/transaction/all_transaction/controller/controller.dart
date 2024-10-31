import 'package:get/get.dart';
import 'package:vyapar_clone/model/all_transaction_report_model.dart';
import 'package:vyapar_clone/repository/api/api_services/api_services.dart';

import '../../../../../../../../core/common/context_provider.dart';
import '../../../../../../../../core/common/loading_var.dart';
import '../../../../../../../../core/common/widget/date_widget/controller/date_controller.dart';
import '../../../../../../../../core/isResponseOk.dart';
import '../../../../../../../../repository/api/end_urls/end_url.dart';
import '../../../../../../../../repository/app_data/user_data/shared_preferences.dart';

class AllTransactionReportController extends GetxController{
final _apiServices = ApiServices();
RxList<AllTransactionReportModel> transactionReportList = <AllTransactionReportModel>[].obs;
String date({String? date}){
  return ContextProvider.filteredDateFormate(date:date);
}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllTransaction();
  }
 void getAllTransaction()async{
  var dateCont = Get.find<DateController>();
  var dtOb = dateCont.selectedDateRange.value;
  
  
   
    setLoadingValue(true);
    var response = await _apiServices.getRequest(
        endurl: EndUrl.getAllTransaction(start:date(date:  dtOb!.start.toString()),end:date(date:  dtOb.end.toString())  ),
        authToken: await SharedPreLocalStorage.getToken());
 if (response != null) {
  setLoadingValue(false);
      if (CheckRStatus.checkResStatus(statusCode: response.statusCode)) {
        var jsonResponse = response.data['TransactionList'];

        List<AllTransactionReportModel> list = List<AllTransactionReportModel>.from(
            jsonResponse.map((x) => AllTransactionReportModel.fromJson(x)));

        transactionReportList.assignAll(list);

        printInfo(info: "transaction list ==${transactionReportList.length}");

        setLoadingValue(false);
      }
      setLoadingValue(false);
      
    }
    setLoadingValue(false);
 }

}