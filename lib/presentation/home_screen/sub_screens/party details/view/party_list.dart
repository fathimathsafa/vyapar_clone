import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/model/party_list_screen.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/sub_PartyDetail/add_party/view/add_party.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/view/party_details.dart';
import 'package:vyapar_clone/service/party_list_service.dart';

class PartyList extends StatefulWidget {
  const PartyList({super.key});

  @override
  _PartyListState createState() => _PartyListState();
}

class _PartyListState extends State<PartyList> {
  late Future<List<PartyModel>> _partyListFuture;
  PartyListService partyListService = PartyListService();

  @override
  void initState() {
    super.initState();
    _partyListFuture = partyListService.fetchPartyList(); // Fetch data here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 245, 252),
      body: FutureBuilder<List<PartyModel>>(
        future: _partyListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Log the error instead of showing it on the UI
            log('Error: ${snapshot.error}');
            return const Center(
                child: Text('Something went wrong. Please try again.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No party data available'));
          }

          final partyList = snapshot.data!;
          return ListView.builder(
            itemCount: partyList.length,
            itemBuilder: (context, index) {
              final party = partyList[index];
              return _buildPartyInfo(
                party.name,
                "12 Sep, 24", // Replace with actual date if available
                "₹ ${party.partyBalance}",
                context,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNewPartyPage()); // Navigation to add new party
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPartyInfo(String name, String date, String amount, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PartyDetails(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(name),
          subtitle: Text(date),
          trailing: Text(
            amount,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
