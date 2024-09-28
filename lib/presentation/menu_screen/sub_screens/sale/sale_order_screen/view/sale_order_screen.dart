import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sale_order_screen/sub_screens/add_sale_screen/view/add_sale_screen.dart';

class SaleOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Orders'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: IconThemeData(color: Colors.black),
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
                  label: Text(
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
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.red),
                  ),
                ),
                ChoiceChip(
                  label: Text(
                    'Open Orders',
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
                  label: Text(
                    'Closed Orders',
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
          Spacer(),

          Container(
            width: 150,
            height: 150,
            child: Lottie.asset('assets/Animation - 1727163424135.json'),
          ),
          SizedBox(height: 20),
          Text(
            'Hey! You have no estimate/quotations yet.\nPlease add your estimate/quotations here',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          Spacer(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSaleOrdercreen(),
            ),
          );
        },
        label: Text('Add Sale Order'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white, // Changed background color to white
    );
  }
}