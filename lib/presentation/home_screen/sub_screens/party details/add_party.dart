import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constatnts/colors.dart';
import '../../../../core/constatnts/text_style.dart';

class AddNewPartyPage extends StatefulWidget {
  @override
  _AddNewPartyPageState createState() => _AddNewPartyPageState();
}

class _AddNewPartyPageState extends State<AddNewPartyPage> {
  bool gstinToggle = true; // Initial state for the toggle switch
  bool partyGroupingToggle = false;
  bool inviteToggle = false;
  bool isExpanded = false; // State to track if dropdown is open
  Map<String, bool> additionalFields = {
    "Additional Field 1": false,
    "Additional Field 2": false,
    "Additional Field 3": false,
    "Date Field": false,
  };

  // Create a GlobalKey for the Scaffold to control its drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add New Party",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Use the GlobalKey to open the end drawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
          )
        ],
      ),
      endDrawer: Drawer(
        elevation: 16.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Party Settings Section
            ListTile(
              title: Text(
                'Party Settings',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text(
                "GSTIN Number",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Switch(
                value: gstinToggle,
                onChanged: (bool value) {
                  setState(() {
                    gstinToggle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                "Party Shipping Address",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Switch(
                value: gstinToggle,
                onChanged: (bool value) {
                  setState(() {
                    gstinToggle = value;
                  });
                },
              ),
            ),
            Divider(),

            // Others Section
            ListTile(
              title: Text(
                'OTHERS',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                "Party Grouping",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Switch(
                value: partyGroupingToggle,
                onChanged: (bool value) {
                  setState(() {
                    partyGroupingToggle = value;
                  });
                },
              ),
            ),

            // Expansion Tile for Party Additional Fields
            ExpansionTile(
              title: Text(
                "Party Additional Fields",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(isExpanded
                  ? Icons.arrow_drop_up
                  : Icons
                      .arrow_drop_down), // Change icon based on expanded state
              onExpansionChanged: (bool expanded) {
                setState(() {
                  isExpanded = expanded; // Update expanded state
                });
              },
              children: [
                Column(
                  children: additionalFields.keys.map((String key) {
                    return CheckboxListTile(
                      title: Text(key),
                      value: additionalFields[key],
                      onChanged: (bool? value) {
                        setState(() {
                          additionalFields[key] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),
                // Save Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity, // Make button take full width
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        backgroundColor: Colors.blue, // Blue background
                      ),
                      onPressed: () {
                        // Handle save logic here
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white), // White text
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ListTile(
              title: Text(
                "Invite parties to add\nthemselves",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Switch(
                value: inviteToggle,
                onChanged: (bool value) {
                  setState(() {
                    inviteToggle = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invite Parties Banner
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
             style: interFontBlack(context,
            color: Colorconst.cBlack,
            fontsize: 17.sp),
              decoration: InputDecoration(
                hintText: "e.g. Ram Prasad",
                helperStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text(
                "Add party through contacts",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),

            // GSTIN Input
            Text("GSTIN", style: TextStyle(fontSize: 16, color: Colors.black)),
            SizedBox(height: 8),
            TextFormField(
              style: interFontBlack(context,
            color: Colorconst.cBlack,
            fontsize: 17.sp),
              initialValue: "1",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
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
