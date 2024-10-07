import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/add_party.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/party%20details/import_party.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/greetin_offer/view/greeting_offer.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/setting/sub_settings/party/view/party.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/setting/sub_settings/reminder/sub_reminder/view/payment_reminder.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/vyaprar_premium/view/vyapar_premium.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/all_party_reports/view/all_party_reports.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_report_by_item_screen/view/party_report_by_items.dart';

class PartyDetails extends StatelessWidget {
  const PartyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    void showShowMorePopup(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                  buildSectionHeader('More Options'),
                  buildIconGrid([
                    iconWithLabel(Icons.comment_bank, 'Invite Party', () {}),
                    iconWithLabel(Icons.book, 'Partywise PnL', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VyaparPremiumScreen(),
                        ),
                      );
                    }),
                    iconWithLabel(Icons.receipt_rounded, 'All Parties Report',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllPartyReportsScreen(),
                        ),
                      );
                    }),
                    iconWithLabel(
                        Icons.monetization_on_outlined, 'Reminder Settings',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentReminderScreen(),
                        ),
                      );
                    }),
                    iconWithLabel(Icons.document_scanner, 'Greetings & Offer',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GreetingOfferScreen(),
                        ),
                      );
                    }),
                  ]),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 245, 252),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                // Quick Links Section inside the container with icons
                Container(
                  padding:
                      EdgeInsets.all(16.0), // Add padding for better spacing
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading "Quick Links"
                      Text(
                        "Quick Links",
                        style: interFontBlack(context),
                      ),
                      SizedBox(height: 10.h),
                      // Icons in a row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => ImportPartyPage()),
                          //     );
                          //   },
                          //   child: _buildQuickLinkButton('Import Party',
                          //       'assets/images/import party.jpeg'),
                          // ), // Replace with your image asset path
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PartyReportByItemsScreen()),
                              );
                            },
                            child: _buildQuickLinkButton('Party Statement',
                                'assets/images/party state.jpeg'),
                          ), // Replace with your image asset path
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PartyScreen()),
                              );
                            },
                            child: _buildQuickLinkButton('Party Settings',
                                'assets/images/party settings.jpeg'),
                          ), // Replace with your image asset path
                          GestureDetector(
                            onTap: () {
                              showShowMorePopup(context);
                            },
                            child: _buildQuickLinkButton(
                                'Show All', 'assets/images/quick_link_4.png'),
                          ), // Replace with your image asset path
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Party Information Section
                SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        3,
                        (index) => Column(
                          children: [
                            _buildPartyInfo('Gokul', '12 Sep, 24', '₹ 0'),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Add New Party Button
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: MediaQuery.of(context).size.width / 3.2,
            right: MediaQuery.of(context).size.width / 3.2,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 350),
              opacity: 1.0,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewPartyPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colorconst.cRed,
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 9.h, horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          "Add New Party",
                          style:
                              interFontGrey(color: Colorconst.cwhite, context),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPartyInfo(String name, String date, String amount) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLinkButton(String label, String imagePath) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 40, // Adjust the width as needed
          height: 40, // Adjust the height as needed
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildIconGrid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 20,
      mainAxisSpacing: 16,
      children: children,
    );
  }

  Widget iconWithLabel(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}

Widget buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}
