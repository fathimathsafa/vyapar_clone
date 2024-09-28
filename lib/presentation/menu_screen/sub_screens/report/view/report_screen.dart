import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/all_party_reports/view/all_party_reports.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/bank_statement_screen/view/bank_statement_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/discount_report_screen/view/discount_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/expense_category_report_screen/view/expense_category_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/expense_item_report_screen/view/expense_item_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/expense_transaction_report_screen/view/expense_transaction_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/form_no27_screen/view/form_no27_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/gst_rate_report_screen/view/gst_rate_report-screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/gst_reports_screen/view/gst_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/loan_report_screen/view/loan_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_report_by_item_screen/view/party_report_by_items.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_reports/party_statement_screen/view/party_statement.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/sale_purchase_by_party_screen/view/sale_purchase_by_party_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/sale_purchase_order_screen/sale_purchase_transaction_screen/view/sale_purchase_transaction_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/sale_purchase_order_screen/view/sale_purchase_order_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/tcs-recievable_screen/view/tcs_recivebla_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/tds_payable_report_screen/view/tds_payable_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/tds_recivable_screen/view/tds_recievable_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/sale_report_screen/view/sale_report_screen.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search
            },
          ),
        ],
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // First Category - Transaction
          const Text(
            'Transaction',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Sale Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaleReport(),
              ),
            );
          }),
          buildSubItem('Purchase Report', context, () {}),
          buildSubItem('Day Book', context, () {}),
          buildSubItem('All Transactions', context, () {}),
          buildSubItemWithIcon(
              'Bill Wise Profit', context, Icons.info_outline, () {}),
          buildSubItem('Profit & Loss', context, () {}),
          buildSubItem('Cashflow', context, () {}),
          buildSubItemWithIcon(
              'Balance Sheet', context, Icons.info_outline, () {}),

          const SizedBox(height: 30),

          // Second Category - Party Reports
          const Text(
            'Party reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Party Statement', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PartyStatement()));
          }),
          buildSubItemWithIcon(
              'Party Wise Profit & Loss',
              context,
              Icons.info_outline,
              color: Colors.yellow,
              () {}),
          buildSubItem('All Parties Report', context, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllPartyReportsScreen()));
          }),
          buildSubItem('Party Report by Items', context, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PartyReportByItemsScreen()));
          }),
          buildSubItem('Sale/Purchase by Party', context, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SalePurchaseByPartyScreen()));
          }),

          const SizedBox(height: 30),

          // Third Category - GST Reports
          const Text(
            'GST repots',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST-1', context, () {}),
          buildSubItem('GST-2', context, () {}),
          buildSubItem('GSTR-3B', context, () {}),
          buildSubItem('GST Transction report', context, () {}),
          buildSubItem('GSTR-9', context, () {}),
          buildSubItem('Sale Summary by HSN', context, () {}),
          buildSubItem('SAC Report', context, () {}),

          //Forth  Category - Item/Stock Reports

          const Text(
            'Item/Stock reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Stock Summary Report', context, () {}),
          buildSubItem('Item Report by Party ', context, () {}),
          buildSubItem('Item Wise Profit & Loss', context, () {}),
          buildSubItem('Low Stock Summary Report', context, () {}),

          buildSubItem('Item Detail Report', context, () {}),
          buildSubItem('Stock Detail Report', context, () {}),
          buildSubItem('Sale/Purchase By Item Category', context, () {}),
          buildSubItem('Stock summary By Item Category', context, () {}),
          buildSubItemWithIcon(
              'Item Batch Report', context, Icons.info_outline, () {}),
          buildSubItemWithIcon(
              'Item Serial Report', context, Icons.info_outline, () {}),
          buildSubItem('Item Wise Discount', context, () {}),
          const SizedBox(height: 30),

          //Fifth  Category -  Business status

          const Text(
            'Business status',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Bank Statement', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BankStatement()));
          }),
          buildSubItem('Discount Report', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DiscountReport()));
          }),

          const SizedBox(height: 30),

          //Sixth  Category -  Taxes

          const Text(
            'Taxes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST Report', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GstReportPage()));
          }),
          buildSubItem('GST Rate Report', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GstRateReport()));
          }),
          buildSubItem('Form No. 27EQ', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FormNo27EQScreen()));
          }),
          buildSubItem('TCS Receivable', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TcsReceivable()));
          }),

          buildSubItem('TDS Payable', context, () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TdsPayable()));
          }),
          buildSubItem('TDS Receivable', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TdsReceivable()));
          }),

          const SizedBox(height: 30),

          //Seventh Category -  Expense report

          const Text(
            'Expense report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Expense Transaction Report', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExpenseTransaction()));
          }),
          buildSubItem('Expense Category Report', context, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExpenseCategoryReport()));
          }),
          buildSubItem('Expense Item Report', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExpenseItemReport()));
          }),

          const SizedBox(height: 30),

          //Eight Category -  Sale/Purchase Order report

          const Text(
            'Sale/Purchase Order report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Sale/Purchase Order Transaction Report', context, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SalePurchaseOrderTransactionReport()));
          }),
          buildSubItem('Sale/Purchase Order Item Report', context, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SalePurchaseOrderItemReport()));
          }),

          const SizedBox(height: 30),

          //Nineth Category -  Loan report

          const Text(
            'Loan Report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Loan Statement', context, () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoanStatementScreen()));
          }),

          const SizedBox(height: 30),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildSubItem(String title, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

  Widget buildSubItemWithIcon(
      String title, BuildContext context, IconData icon, VoidCallback onTap,
      {Color color = Colors.grey}) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(width: 5),
            Icon(icon, size: 16, color: color),
          ],
        ),
      ),
    );
  }
}
