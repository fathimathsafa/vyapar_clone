import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/all_transaction/controller/controller.dart';

class AllTransaction extends StatelessWidget {
   final controller = Get.put(AllTransactionReportController());
  @override
  Widget build(BuildContext context) {
    // controller.getAllTransaction();
    return Scaffold(

      floatingActionButton: InkWell(
        onTap: () {
          controller.getAllTransaction();
          
        },
        child:const CircleAvatar(radius: 30,
        child: Center(child: Icon(Icons.refresh_outlined),),
        )),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('All Transactions', style: TextStyle(fontSize: 16.sp)),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, size: 20.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_on, size: 20.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: 
         Padding(
          padding: EdgeInsets.all(6.w),
          child: Column(
            children: [
               DateDropdownAndPicker(),
                  Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Row(
                        children: [
                          Text(
                            'All Transactions',
                            style: TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                          SizedBox(height: 10.h),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Party Name All Parties',
                            style: TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                          SizedBox(height: 10.h),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          ),
                        ],
                      ),
                     
                      Divider(),
                      Obx(
                        () {
                          return Column( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:isLoading.value ? const[ Center(child: CircularProgressIndicator(),)]: List.generate( controller.transactionReportList.length, (index) {
                            var ob = controller.transactionReportList[index];
                            return _buildTransactionCard(ob.party!.name.toString(), 'Amount', '₹ ${ob.totalAmount.toString()}', 'Balance',
                              '₹ ${ob.balance.toString()}', 'SALE:${ob.reference!.documentNumber.toString()}', ob.transactionDate.toString());
                          },));
                        }
                      )
                      // _buildTransactionCard('Gokul', 'Amount', '₹ 10.00', 'Balance',
                      //     '₹ 0.00', 'SALE: 1', '12 SEP, 24'),
                      // _buildTransactionCard('Gokul', 'Amount', '₹ 10,000.00', 'Balance',
                      //     '₹ 10,000.00', 'SALE 2', '19 SEP, 24'),
                      // _buildTransactionCard('Gokul', 'Amount', '₹ 10,000.00', 'Balance',
                      //     '₹ 10,000.00', 'CN 1', '19 SEP, 24'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget _buildTransactionCard(String name, String label1, String value1,
      String label2, String value2, String txnType, String date) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.black)),
                SizedBox(height: 5.h),
                Text(date,
                    style: TextStyle(fontSize: 12.sp, color: Colors.black)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(txnType,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('$label1: ',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                Text(value1,
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                SizedBox(height: 5.h),
                Text('$label2: ',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                Text(value2,
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
