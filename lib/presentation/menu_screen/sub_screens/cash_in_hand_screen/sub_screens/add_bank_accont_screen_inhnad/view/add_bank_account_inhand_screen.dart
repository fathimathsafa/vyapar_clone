
import 'package:flutter/material.dart';

class BankTransfer extends StatefulWidget {
  const BankTransfer({super.key});

  @override
  State<BankTransfer> createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  bool _printBankDetails = false; // State for bank details toggle
  bool _printUPIQR = false; // State for UPI QR toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bank Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Bank Name/ Account Display Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Opening Balance",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "As On",
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () {
                        // Show date picker logic here
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              ListTile(
                title: Text("Print bank details on invoices"),
                trailing: Switch(
                  value: _printBankDetails,
                  onChanged: (bool value) {
                    setState(() {
                      _printBankDetails = value;
                    });
                  },
                ),
                leading: Icon(Icons.info_outline),
              ),
              ListTile(
                title: Text("Print UPI QR Code on invoices"),
                trailing: Switch(
                  value: _printUPIQR,
                  onChanged: (bool value) {
                    setState(() {
                      _printUPIQR = value;
                    });
                  },
                ),
                leading: Icon(Icons.info_outline),
              ),
              if (_printBankDetails) ...[
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Account Holder Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Account Number",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "IFSC Code",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Branch Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              if (_printUPIQR) ...[
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "UPI ID for QR Code",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Handle save button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
