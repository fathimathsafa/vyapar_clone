import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/images.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_sale.dart';

import '../widget/header.dart';
import '../widget/header_buttons.dart';

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
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const HeaderWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            HeaderButtons(
                              index: 0,
                              selectedIndex: 0,
                              onSingleTap: () {},
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            HeaderButtons(
                              butnTxt: "Party Details",
                              index: 1,
                              selectedIndex: 0,
                              onSingleTap: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      )
                    ],
                  ),
                ),
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
                                            builder: (context) =>
                                                SaleListScreen(),
                                          ),
                                        );
                                      },
                                      child: _quickLinkItem("quick_link_2.png",
                                          "Sale Report", context),
                                    ),
                                    _quickLinkItem("quick_link_3.png",
                                        "Txn Settings", context),
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
                  iconWithLabel(Icons.comment_bank, 'Bank Account'),
                  iconWithLabel(Icons.book, 'Day Book'),
                  iconWithLabel(Icons.receipt_rounded, 'All Txns Report'),
                  iconWithLabel(
                      Icons.monetization_on_outlined, 'Profit & Loss'),
                  iconWithLabel(Icons.document_scanner, 'Balance Sheet'),
                  iconWithLabel(Icons.receipt_long, 'Billwise PnL'),
                  iconWithLabel(Icons.print_outlined, 'Print Settings'),
                  iconWithLabel(Icons.sms, 'Txn SMS Settings'),
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
                  iconWithLabel(Icons.payment, 'Payment-In'),
                  iconWithLabel(Icons.assignment_return, 'Sale Return'),
                  iconWithLabel(Icons.local_shipping, 'Delivery Challan'),
                  iconWithLabel(Icons.receipt, 'Estimate/Quotation'),
                  iconWithLabel(Icons.description, 'Proforma Invoice'),
                  iconWithLabel(Icons.receipt_long, 'Sale Invoice'),
                  iconWithLabel(Icons.add_shopping_cart, 'Sale Order'),
                ]),
                Divider(),
                buildSectionHeader('Purchase Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.shopping_cart, 'Purchase'),
                  iconWithLabel(Icons.payment_outlined, 'Payment-Out'),
                  iconWithLabel(Icons.assignment_return, 'Purchase Return'),
                  iconWithLabel(Icons.receipt, 'Purchase Order'),
                ]),
                Divider(),
                buildSectionHeader('Other Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.attach_money, 'Expenses'),
                  iconWithLabel(Icons.sync, 'P2P Transfer'),
                ]),
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

  Widget iconWithLabel(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
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
