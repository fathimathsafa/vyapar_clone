class EndUrl {
  
  static const registerUrl='auth/register';
  static const loginUrl='auth/login';
  static const unitListUrl='units/';
  static const getLatestInvoice='invoice/invoiceNo';
  static const statesUrl='states';
  static const taxUrl='taxes';
  static const invoiceUrl='invoice/';
  //party
  static const getAllParty='parties/balance';
  static const addParty='parties/';
  //challan
  static const getChallanNo='challan/challanNo';
  static const getAllChallan='challan/';
  //payment out
  static const createPaymentOutUrl='paymentOut/';
  static const getAllPaymentOutUrl='paymentOut/';
  static const paymentOutRecieptNo='paymentOut/receiptNo';
 // items
  static const getCategory='category/';

 //Quatation
  static const getReferencNo='quotation/referenceNo';
  static const quotationUrl='quotation/';
// sale order
  static const saleOrder='order/';
  static const orderNo='order/orderNo';
//payment in
  static const createPayIn='paymentIn';


//transaction
 static String getAllTransaction({String? start,String? end}){
  return "reports/transaction?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";
}

 static String getProfitLoss({String? start,String? end}){
  return "reports/profitLoss?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";
}

 static String getDayBookReport({String? start,String? end})=>
   "reports/day-book?date=${start??2024-10-01}";

 static String getItemPartyReport({String? start,String? end})=>
   "reports/party/item?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";

 static String getDocPrReport({String? start,String? end})=>
   "reports/discountPercent?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";

 static String getOrderReport({String? start,String? end})=>
   "reports/orders?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}&orderType=Purchase";

 static String getOrderItemReport({String? start,String? end})=>
   "reports/orders/order-items?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}&orderType=Sale";

 static String getCashFlowReport({String? start,String? end})=>
   "reports/cash-flow?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";

 static String getExpenseTranReport({String? start,String? end})=>
   "reports/expense/transactions?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";

 static String getExpenseCateGoryReport({String? start,String? end})=>
   "reports/expense/categories?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";

 static String getExpenseItemReport({String? start,String? end})=>
   "reports/expense/items?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";

 static String getBankStatementReport({String? start,String? end,String?bankName})=>
   "reports/expense/bank-statement?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}&bankName=${bankName??'State Bank of India'}";


 static String getPartyReport({String? start,String? end})=>
   "reports/party/item?fromDate=${start??2024-10-01}&toDate=${end??2024-10-30}";
 

//products
static const String addItem = "products/";

//add bank
static const String bank = "bank";


}
