import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/bank_accounts_screen/sub_screens/add_bank_accont_screen/view/add_bank_accont_screen.dart';

class BankAccountsPage extends StatelessWidget {
  const BankAccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bank Accounts',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle back button
            },
          ),
          backgroundColor: const Color.fromARGB(255, 142, 33, 243),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.87,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 142, 33, 243),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/bank_and_cah.png',
                        height: 200,
                        width: 230,
                        scale: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.67,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 142, 33, 243),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.67,
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.business_sharp,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              'Add Your bank &record all your bank\ntransaction',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.qr_code,
                              color: Colors.green,
                            ),
                            title: Text(
                              'Get payment into your bank account\nvia QR code.',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.video_collection_sharp,
                              color: Colors.green,
                            ),
                            title: Text(
                              'How to add Bank Account',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12),
                            ),
                            subtitle: Text(
                              'Watch Video',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddBankAccount(),
                                ),
                              );
                            },
                            label: const Text(
                              'Add Bank',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}