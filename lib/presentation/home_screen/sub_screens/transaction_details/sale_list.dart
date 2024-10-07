import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/images.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/transaction_details/add_sale.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/bank_accounts_screen/view/bank_accounts_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/create/sub_create/pro_forma_invoice/view/pro_forma_invoice.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/setting/sub_settings/invoice_print/view/invoice_print.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/setting/sub_settings/transaction/view/transaction.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/vyaprar_premium/view/vyapar_premium.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/payment_out_screen/view/all_transaction_payment_out_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/purchase_list_screen/view/purchase_list_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/purchase_order_list/view/purchase_order_list.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/purchase/purchase_return/view/purchase_return_list.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/all_transaction/all_transaction.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/day_book/day_book.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/profit_loss_report/profit_loss_reoprt.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/sale_report_screen/view/sale_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/delivery_challan_screen/view/delivery_chellan.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/estimate_quotation_screen/sub_screens/add_estimate_screen/view/add_estimate_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/payment_in_screen/sub_screen/payment_in_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sale_invoice_screen/view/sale_invoice_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sale_order_screen/view/sale_order_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sales_return/view/sales_return.dart';

class SaleListScreen extends StatelessWidget {
  SaleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colorconst.cSecondaryBlue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 0.4.w, color: Colorconst.cGrey),
                                  right: BorderSide(
                                      width: 0.4.w, color: Colorconst.cGrey),
                                  bottom: BorderSide(
                                      width: 0.4.w, color: Colorconst.cGrey)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Quick Links",
                                  style: interFontBlack(context),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _showTransactionPopup(context);
                                      },
                                      child: _quickLinkItem("quick_link_1.png",
                                          "Add Txn", context),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SaleReport(),
                                          ),
                                        );
                                      },
                                      child: _quickLinkItem("quick_link_2.png",
                                          "Sale Report", context),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TransactionSettingScreen(),
                                          ),
                                        );
                                      },
                                      child: _quickLinkItem("quick_link_3.png",
                                          "Txn Settings", context),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showShowMorePopup(context);
                                      },
                                      child: _quickLinkItem("quick_link_4.png",
                                          "Show All", context),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          style: interFontBlack(context),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.filter_alt_outlined,
                                  color: Colors.black45, size: 25.sp),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0.h),
                                child: Icon(
                                  Icons.search_outlined,
                                  color: Colorconst.cBlue,
                                  size: 25.sp,
                                ),
                              ),
                              hintText: "Search for a transaction",
                              hintStyle: interFontGrey(context),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Empty list",
                              style: interFontBlack(context),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Positioned(
              bottom: 16.0,
              left: MediaQuery.of(context).size.width / 3.2,
              right: MediaQuery.of(context).size.width / 3.2,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 350),
                opacity: 1.0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddSaleInvoiceScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colorconst.cRed,
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 9.h, horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Imageconst().setImage(
                            imageName: "rupee_img.png",
                            hieght: 20.w,
                            width: 20.w,
                          ),
                          Text(
                            "Add New Sale",
                            style: interFontGrey(
                                color: Colorconst.cwhite, context),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void showShowMorePopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                buildSectionHeader('Sale Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.comment_bank, 'Bank Account', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BankAccountsPage(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.book, 'Day Book', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayBook(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.receipt_rounded, 'All Txns Report', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllTransaction(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.monetization_on_outlined, 'Profit & Loss',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfitAndLossReoprt(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.document_scanner, 'Balance Sheet', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VyaparPremiumScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.receipt_long, 'Billwise PnL', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VyaparPremiumScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.print_outlined, 'Print Settings', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InvoicePrintScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.sms, 'Txn SMS Settings', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionSettingScreen(),
                      ),
                    );
                  }),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTransactionPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                buildSectionHeader('Sale Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.payment, 'Payment-In', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentInScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.assignment_return, 'Sale Return', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SaleReturnScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.local_shipping, 'Delivery Challan', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeliveryChallanScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.receipt, 'Estimate/Quotation', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EstimateQuatationScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.description, 'Proforma Invoice', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProFormaInvoice(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.receipt_long, 'Sale Invoice', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SaleInvoistListScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.add_shopping_cart, 'Sale Order', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SaleOrderScreen(),
                      ),
                    );
                  }),
                ]),
                Divider(),
                buildSectionHeader('Purchase Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.shopping_cart, 'Purchase', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseListScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.payment_outlined, 'Payment-Out', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentAllTransactionScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.assignment_return, 'Purchase Return', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseReturnListScreen(),
                      ),
                    );
                  }),
                  iconWithLabel(Icons.receipt, 'Purchase Order', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseOrderListScreen(),
                      ),
                    );
                  }),
                ]),
                // Divider(),
                // buildSectionHeader('Other Transactions'),
                // buildIconGrid([
                //   iconWithLabel(Icons.attach_money, 'Expenses', () {}),
                //   iconWithLabel(Icons.sync, 'P2P Transfer', () {}),
                // ]),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildIconGrid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 20,
      mainAxisSpacing: 16,
      children: children,
    );
  }

  Widget iconWithLabel(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}

Widget buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}

Widget _quickLinkItem(String imageName, String label, BuildContext context) {
  return Column(
    children: [
      Imageconst().setImage(
        imageName: imageName,
        hieght: 45.h,
        width: 60.w,
        fit: BoxFit.cover,
      ),
      SizedBox(height: 5.h), // Add some space between the image and text
      Text(
        label,
        style: interFontBlack(context), // Use your defined text style
      ),
    ],
  );
}
