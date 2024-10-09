// import 'package:flutter/material.dart';
// // import 'package:contacts_service/contacts_service.dart'; // Import contacts_service
// import 'package:permission_handler/permission_handler.dart'; // Import permission_handler

// class ImportPartyPage extends StatefulWidget {
//   @override
//   _ImportPartyPageState createState() => _ImportPartyPageState();
// }

// class _ImportPartyPageState extends State<ImportPartyPage> {
//   // List<Contact> _contacts = []; // List to hold contacts
//   TextEditingController _searchController =
//       TextEditingController(); // Search controller

//   @override
//   void initState() {
//     super.initState();
//     // Show the dialog when the page is opened
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showAlertDialog(context);
//     });
//   }

//   void _showAlertDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text(
//             'Please allow us to collect your\ncontacts to enhance your experience\non Vyapar.',
//             style: TextStyle(color: Colors.black),
//             textAlign: TextAlign.start,
//           ),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue background
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the first dialog
//                 _showPermissionDialog(context); // Show the second dialog
//               },
//               child: Text(
//                 "OK",
//                 style: TextStyle(color: Colors.white), // White text
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showPermissionDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min, // Make the dialog content compact
//             children: [
//               Icon(Icons.contacts, size: 50), // Icon in the center
//               SizedBox(height: 10), // Space between icon and text
//               Text(
//                 'Allow Vyapar to access your contacts?',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.black),
//               ),
//               SizedBox(height: 20), // Space before buttons
//               Row(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceEvenly, // Space buttons evenly
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue, // Blue background
//                     ),
//                     onPressed: () async {
//                       // Handle allow action
//                       Navigator.of(context).pop(); // Close the second dialog
//                       await _requestContactsPermission(); // Request permission
//                     },
//                     child: Text(
//                       "Allow",
//                       style: TextStyle(color: Colors.white), // White text
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey, // Grey background
//                     ),
//                     onPressed: () {
//                       // Handle don't allow action here
//                       Navigator.of(context).pop(); // Close the second dialog
//                     },
//                     child: Text(
//                       "Don't Allow",
//                       style: TextStyle(color: Colors.white), // White text
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _requestContactsPermission() async {
//     var status =
//         await Permission.contacts.request(); // Request contact permission
//     if (status.isGranted) {
//       // If permission is granted, fetch the contacts
//       // _fetchContacts();
//     } else {
//       // Handle the case when permission is denied
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text(
//           "Contacts permission denied.",
//           style: TextStyle(color: Colors.black),
//         )),
//       );
//     }
//   }

//   // Future<void> _fetchContacts() async {
//   //   Iterable<Contact> contacts =
//   //       await ContactsService.getContacts(); // Fetch contacts
//   //   setState(() {
//   //     _contacts = contacts.toList(); // Update the state with fetched contacts
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           'Import Parties from Contacts',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search Bar
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search Contacts...',
//                 helperStyle: TextStyle(color: Colors.black),
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(
//                   Icons.search, // Search icon
//                   color: Colors.blue, // Icon color
//                 ),
//               ),
//               onChanged: (value) {
//                 // Implement search functionality if needed
//                 setState(() {
//                   // Update UI based on search value
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             // Display contacts
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               // itemCount: _contacts.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     // _contacts[index].displayName ?? 'No Name',
//                     "",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   subtitle: Text(
//                     // _contacts[index].phones?.isNotEmpty == true
//                     //     ? _contacts[index].phones!.first.value ?? ''
//                     //     : 'No Phone Number',
//                     "",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
