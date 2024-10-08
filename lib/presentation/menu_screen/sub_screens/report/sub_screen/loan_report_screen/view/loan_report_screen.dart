import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
// import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class LoanStatementScreen extends StatelessWidget {
  const LoanStatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Loan Statement', style: TextStyle(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DateDropdownAndPicker(),
                ],
              ),

              const Divider(),
              const SizedBox(height: 12),

              // Filters section commented out for future use
              // TODO: Add filter section if necessary

              const SizedBox(
                  height: 100), // Spacing before image and no data section

              Center(
                child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/images/loan_statement_pic.png')),
              ),
              const SizedBox(height: 50),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Add your loan account on Vyapar\nand manage your Business Loans',
                      style: TextStyle(fontSize: 15, color: Colorconst.cBlack),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
