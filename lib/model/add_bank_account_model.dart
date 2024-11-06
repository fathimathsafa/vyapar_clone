class AddBankAccountModel {
  final String bankName;
  final double openingBalance;
  final DateTime asOfDate;
  final bool printUPIQRCodeOnInvoice;
  final bool printBankDetailsOnInvoice;
  final String accountNumber;
  final String ifscCode;
  final String upiIDForQRCode;
  final String branchName;
  final String accountHolderName;
  final String createdBy;
  final String id;

  AddBankAccountModel({
    required this.bankName,
    required this.openingBalance,
    required this.asOfDate,
    required this.printUPIQRCodeOnInvoice,
    required this.printBankDetailsOnInvoice,
    required this.accountNumber,
    required this.ifscCode,
    required this.upiIDForQRCode,
    required this.branchName,
    required this.accountHolderName,
    required this.createdBy,
    required this.id,
  });

  // Factory method to parse JSON into a AddBankAccountModel instance
  factory AddBankAccountModel.fromJson(Map<String, dynamic> json) {
    return AddBankAccountModel(
      bankName: json['bankName'],
      openingBalance: (json['openingBalance'] as num).toDouble(),
      asOfDate: DateTime.parse(json['asOfDate']),
      printUPIQRCodeOnInvoice: json['printUPIQRCodeOnInvoice'],
      printBankDetailsOnInvoice: json['printBankDetailsOnInvoice'],
      accountNumber: json['accountNumber'],
      ifscCode: json['ifscCode'],
      upiIDForQRCode: json['upiIDForQRCode'],
      branchName: json['branchName'],
      accountHolderName: json['accountHolderName'],
      createdBy: json['createdBy'],
      id: json['_id'],
    );
  }
}
