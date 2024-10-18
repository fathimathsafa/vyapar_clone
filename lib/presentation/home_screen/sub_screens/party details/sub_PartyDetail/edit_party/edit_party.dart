import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/sub_PartyDetail/add_party/controller/controller.dart';

class EditPartyPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(AddPartyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Edit Party", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          )
        ],
      ),
      endDrawer: Drawer(
        elevation: 16.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer contents here...
          ],
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

            // Party Name Input
            Text("Party Name*", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            TextFormField(
              onChanged: (value) {
                _controller.isPartyNameFilled.value = value.isNotEmpty;
              },
              style: TextStyle(fontSize: 17.sp, color: Colors.black),
              decoration: InputDecoration(
                hintText: "e.g. Ram Prasad",
                helperStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),

            // GSTIN Input - Moved to directly below Party Name
            Obx(() {
              if (_controller.isPartyNameFilled.value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("GSTIN", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      style: TextStyle(fontSize: 17.sp, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "e.g. 22AAABC1234D1Z2",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Other fields below GSTIN...
                    Text("Contact Number", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      style: TextStyle(fontSize: 17.sp, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "e.g. +91 9876543210",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Opening Balance", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 17.sp, color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
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
                      style: TextStyle(fontSize: 17.sp, color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Tabs Section
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(
                            labelColor: Colors.black,
                            indicatorColor: Colors.blue,
                            tabs: [
                              Tab(text: "Addresses"),
                              Tab(text: "GST Details"),
                            ],
                          ),
                          SizedBox(
                            height: 200, // Set a fixed height for tab content
                            child: TabBarView(
                              children: [
                                // Addresses Tab Content
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Billing Address",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text("Email Address",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // GST Details Tab Content
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("GST Type",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text("State",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return SizedBox();
            }),

            Spacer(),

            // Buttons at the bottom
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300], // Button color
                    ),
                    child: Text("Save & New",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey, // Button color
                    ),
                    child: Text("Save Party",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
