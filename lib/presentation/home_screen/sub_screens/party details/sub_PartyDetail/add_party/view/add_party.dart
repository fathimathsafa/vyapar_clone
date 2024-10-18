import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/sub_PartyDetail/add_party/controller/controller.dart';

class AddNewPartyPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(AddPartyController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController gstInController = TextEditingController();
  final TextEditingController gstTypeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController billingAddressController =
      TextEditingController();
  final TextEditingController shippingAddressController =
      TextEditingController();
  final TextEditingController openingBalanceController =
      TextEditingController();
  final TextEditingController balanceTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Add New Party", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.pink[50],
              child: ListTile(
                leading: Icon(Icons.share, color: Colors.red),
                title: Text("Invite Parties",
                    style: TextStyle(color: Colors.black)),
                subtitle: Text("to fill their details",
                    style: TextStyle(color: Colors.black)),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text("NEW",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Party Name*", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            TextFormField(
              controller: nameController,
              onChanged: (value) {
                _controller.isPartyNameFilled.value = value.isNotEmpty;
              },
              style: TextStyle(fontSize: 17, color: Colors.black),
              decoration: InputDecoration(
                hintText: "e.g. Ram Prasad",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Obx(() {
              if (_controller.isPartyNameFilled.value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("GSTIN", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: gstInController,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "e.g. 22AAABC1234D1Z2",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Contact Number", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: phoneController,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "e.g. +91 9876543210",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Opening Balance", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: openingBalanceController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Balance Type", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: balanceTypeController,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "e.g. toPay or toReceive",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Date", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          _controller.selectedDate.value =
                              selectedDate.toString();
                        }
                      },
                      readOnly: true,
                      controller: TextEditingController(
                        text: _controller.selectedDate.value.isNotEmpty
                            ? _controller.selectedDate.value
                            : "Select Date",
                      ),
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.addNewParty(
                                name: nameController.text,
                                gstIn: gstInController.text,
                                gstType: gstTypeController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                state: stateController.text,
                                billingAddress: billingAddressController.text,
                                shippingAddress: shippingAddressController.text,
                                openingBalance:
                                    double.parse(openingBalanceController.text),
                                asOfDate: _controller.selectedDate.value,
                                balanceType: balanceTypeController.text,
                              );
                            },
                            child: Text("Save Party"),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
