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

  

}
