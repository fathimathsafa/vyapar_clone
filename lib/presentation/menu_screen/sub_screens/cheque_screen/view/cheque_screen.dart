
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Cheques extends StatelessWidget {
  const Cheques({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Cheque'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Lottie.asset('assets/cheques.json'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hey! You hae not added any cheques\nyet.Any payment involving cheque\nappears here',
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }
}
