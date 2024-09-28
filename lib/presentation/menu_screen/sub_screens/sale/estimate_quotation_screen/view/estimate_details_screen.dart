import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/estimate_quotation_screen/sub_screens/add_estimate_screen/view/add_estimate_screen.dart';

class EstimateDetailsScreen extends StatelessWidget {
  const EstimateDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Estimate Details'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Tabs for 'All', 'Open Estimate', 'Closed Estimate' at the top
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                  label: const Text(
                    'All',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  selected: true,
                  backgroundColor: Colors.white,
                  selectedColor: Colors.red.shade100,
                  onSelected: (_) {},
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.red),
                  ),
                ),
                ChoiceChip(
                  label: const Text(
                    'Open Estimate',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  selected: false,
                  backgroundColor: Colors.grey.shade200,
                  onSelected: (_) {},
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                ChoiceChip(
                  label: const Text(
                    'Closed Estimate',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  selected: false,
                  backgroundColor: Colors.grey.shade200,
                  onSelected: (_) {},
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          SizedBox(
            width: 150,
            height: 150,
            child: Lottie.asset('assets/animation/Animation - 1727163424135.json'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Hey! You have no estimate/quotations yet.\nPlease add your estimate/quotations here',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          const Spacer(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EstimateQuotationScreen(),
            ),
          );
        },
        label: const Text('Add Estimate'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white, // Changed background color to white
    );
  }
}