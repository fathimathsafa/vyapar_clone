import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class CompanyController extends GetxController {
  // List of data for the companies
  var companyData = <Map<String, dynamic>>[
    {
      'name': 'Abhi',
      'id': '1234567890',
      'statusColor': Colorconst.Green,
      'syncStatus': 'Sync Off',
    },
    {
      'name': 'Arun',
      'id': '1234567890',
      'statusColor': Colors.green,
      'syncStatus': 'Sync On',
    },
  ].obs; // Observable list
}
