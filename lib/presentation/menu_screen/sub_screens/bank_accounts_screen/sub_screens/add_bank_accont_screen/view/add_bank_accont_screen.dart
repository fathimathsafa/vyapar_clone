import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBankAccount extends StatefulWidget {
  @override
  _AddBankAccountState createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  bool _printBankDetails = false; // State for bank details toggle
  bool _printUPIQR = false; // State for UPI QR toggle
  final TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Show the current date when the app starts
    _controller.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat('yyyy-MM-dd').format(
            _selectedDate); // Update the text field with the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add Bank Account',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.all(16.0.w),
              color: Colorconst.cwhite,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                        color: Colorconst
                            .cBlack // Change this to your desired text color
                        ),
                    decoration: const InputDecoration(
                      labelText: "Bank Name/ Account Display Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 25.w),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colorconst
                                .cBlack, // Change this to your desired text color
                          ),
                          decoration: const InputDecoration(
                            labelText: "Opening Balance",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          style: const TextStyle(color: Colorconst.cBlack),

                          decoration: const InputDecoration(
                            labelText: "As On",
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                          onTap: () =>
                              _selectDate(context), // Open the calendar on tap
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(10.0.w),
              color: Colorconst.cwhite,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Print bank details on invoices",
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    trailing: Switch(
                      value: _printBankDetails,
                      onChanged: (bool value) {
                        setState(() {
                          _printBankDetails = value;
                        });
                      },
                    ),
                    leading: const Icon(Icons.info_outline),
                  ),
                  ListTile(
                    title: Text(
                      "Print UPI QR Code on invoices",
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    trailing: Switch(
                      value: _printUPIQR,
                      onChanged: (bool value) {
                        setState(() {
                          _printUPIQR = value;
                        });
                      },
                    ),
                    leading: const Icon(Icons.info_outline),
                  ),
                  if (_printBankDetails) ...[
                    SizedBox(height: 20.h),
                    TextFormField(
                      style: const TextStyle(
                        color: Colorconst.cBlack,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Account Holder Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      style: const TextStyle(
                        color: Colorconst.cBlack,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Account Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      style: const TextStyle(
                        color: Colorconst.cBlack,
                      ),
                      decoration: const InputDecoration(
                        labelText: "IFSC Code",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      style: const TextStyle(
                        color: Colorconst.cBlack,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Branch Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                  if (_printUPIQR) ...[
                    SizedBox(height: 20.h),
                    TextFormField(
                      style: const TextStyle(
                        color: Colorconst.cBlack,
                      ),
                      decoration: const InputDecoration(
                        labelText: "UPI ID for QR Code",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: Colorconst.cRed,
          onPressed: () {
          },
          child: Text(
            'Save',
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
