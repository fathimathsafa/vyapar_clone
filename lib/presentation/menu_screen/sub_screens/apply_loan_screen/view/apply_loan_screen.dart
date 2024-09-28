
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ApplyLoanPage extends StatefulWidget {
  @override
  _ApplyLoanPageState createState() => _ApplyLoanPageState();
}

class _ApplyLoanPageState extends State<ApplyLoanPage> {
  bool _agreedToTOS = false;
  int _currentPage = 0;

  final List<String> _loanDescriptions = [
    'Get Collateral-Free Unsecured Loans',
    'Get Up To Rs. 10Lac Business Loan',
    '100% Digital Process',
    'Disbursal Within 48 Hours',
  ];

  // List of image URLs for the slides
  final List<String> _imageUrls = [
    'assets/slides1.jpeg', // Replace with your actual image paths
    'assets/slides2.jpeg',
    'assets/slides3.jpeg',
    'assets/slides4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Apply Loan', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Carousel Slider in the center of the screen
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center inside the Expanded
                children: [
                  // Carousel Slider
                  CarouselSlider.builder(
                    itemCount: _imageUrls.length, // Number of images
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Image.asset(
                        _imageUrls[index], // Use the actual image path
                        fit: BoxFit.cover, // Cover the entire area
                        width: double.infinity, // Ensure it covers full width
                      );
                    },
                  ),
                  SizedBox(height: 20),

                  // Loan description text based on current slide
                  Text(
                    _loanDescriptions[_currentPage],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),

            // Terms and Conditions agreement with checkbox
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _agreedToTOS,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreedToTOS = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I have read and agree to the ',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: 'T&C',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle T&C tap
                                },
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Privacy Policy tap
                                },
                            ),
                            TextSpan(
                              text:
                                  ' of Vyapar\nand hereby give my consent to Vyapar and its associated\lending partners to receive my credit bureau and information\nand transaction history for the purpose of loan underwriting',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Apply Now button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _agreedToTOS
                        ? () {
                            // Handle apply now action
                          }
                        : null, // Disable button if TOS not agreed
                    child: Text(
                      'Apply Now',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
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
