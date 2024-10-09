import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalePurchaseByPartyScreen extends StatefulWidget {
  @override
  State<SalePurchaseByPartyScreen> createState() =>
      _SalePurchaseByPartyScreenState();
}

class _SalePurchaseByPartyScreenState extends State<SalePurchaseByPartyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sale/Purchase By Party",
          style: TextStyle(
            color: Colorconst.cBlack,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colorconst.cBlack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colorconst.cRed,
            ),
            onPressed: () {
              //  Fluttertoast.showToast(msg: "PDF Export Clicked");
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colorconst.Green),
            onPressed: () {
              // Fluttertoast.showToast(msg: "Excel Export Clicked");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade100,
                Colors.lightBlue.shade50,
                Colors.lightBlue.shade50,
                Colors.lightBlue.shade50,
                Colors.lightBlue.shade50,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                color: Colorconst.cwhite,
                child: DateDropdownAndPicker(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(width: 15.h),
                  Container(
                    height: 50.h,
                    width: 140.h,
                    decoration: BoxDecoration(
                        color: Colorconst.cwhite,
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Sale Amount',
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 13.sp),
                        ),
                        Text(
                          '\₹5000',
                          style: TextStyle(
                              color: Colorconst.cBlack, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Container(
                    height: 50.h,
                    width: 140.h,
                    decoration: BoxDecoration(
                        color: Colorconst.cwhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Total  Purchase Amount',
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 13.sp),
                        ),
                        Text(
                          '\₹5000',
                          style: TextStyle(
                              color: Colorconst.cBlack, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Table for transactions
              _buildTransactionsTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionsTable() {
    return Card(
      color: Colorconst.cwhite,
      margin: EdgeInsets.all(10.w),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              'Party name',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
            title: Center(
              child: Text(
                'Sale',
                style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
              ),
            ),
            trailing: Text(
              'Purchase',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
          ),
          const Divider(),
          _buildTransactionRow('Name', '\₹1000', '\₹4000'),
          const Divider(),
          _buildTransactionRow('Name', '\₹1000', '\₹4000'),
          const Divider(),
          _buildTransactionRow('Name', '\₹1000', '\₹4000'),
          const Divider(),
          SizedBox(
            height: 287.h,
          )
        ],
      ),
    );
  }

  Widget _buildTransactionRow(String name, String sale, String purchase) {
    return ListTile(
      leading: Text(
        name,
        style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
      ),
      title: Center(
          child: Text(
        sale,
        style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
      )),
      trailing: Text(
        purchase,
        style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
      ),
    );
  }
}
