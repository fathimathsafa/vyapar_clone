
import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/cash_in_hand_screen/sub_screens/add_bank_accont_screen_inhnad/view/add_bank_account_inhand_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a loading delay
    Future.delayed(const Duration(seconds: 3), () {
      // After the delay, navigate to the BankTransfer page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BankTransfer(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Background color
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // Card color
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12, // Shadow color
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Custom CircularProgressIndicator with colors
              SizedBox(
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 6,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.green), // Outer circle color
                        ),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.green.withOpacity(0.1),
                        child: const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "You don't have a Bank Account added on Vyapar",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Redirecting you to add a new Bank Account...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
