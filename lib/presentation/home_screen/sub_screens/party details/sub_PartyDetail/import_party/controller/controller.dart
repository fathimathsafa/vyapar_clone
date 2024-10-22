import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'package:get/get.dart';

class ImportPartyController extends GetxController {
  final searchController = TextEditingController();

  RxList contacts = <Contact>[].obs;

  RxBool showLoading = false.obs;

void setLoading(value){
  showLoading.value = value;
}

  Future<void> _fetchContacts() async {
    setLoading(true);
    if (await FlutterContacts.requestPermission()) {
      // List<Contact> contact = await FlutterContacts.getContacts();

      List<Contact> contact = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      contacts.assignAll(contact);

      printInfo(info: "contact length ==${contacts.length}");
    }
    // Iterable<Contact> contacts =
    //     await ContactsService.getContacts(); // Fetch contacts
    // setState(() {
    //   _contacts = contacts.toList(); // Update the state with fetched contacts
    // });

    setLoading(false);
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _fetchContacts();
  }
}
