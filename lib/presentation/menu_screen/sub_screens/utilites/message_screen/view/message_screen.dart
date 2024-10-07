// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:vyapar_clone/presentation/menu_screen/sub_screens/manage_companies/sub_screens/my_companies/view/my_companies.dart';
// import 'package:vyapar_clone/presentation/menu_screen/sub_screens/manage_companies/sub_screens/shared_with_me_screen/view/shared_with_me_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/message_screen/sub_screens/sent_screen/view/sent_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/message_screen/sub_screens/unsent_screen/view/unsent_screen.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colorconst.cwhite,
        ),
        title: const Text(
          'Messages',
          style: TextStyle(color: Colorconst.cwhite),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colorconst.cwhite, // Color for the selected tab's text
          unselectedLabelColor:
              Colors.grey, // Color for the unselected tab's text
          labelStyle: TextStyle(
            fontSize: 16.sp, // Text size for the selected tab
            fontWeight: FontWeight.normal, // Text weight for the selected tab
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp, // Text size for the unselected tab
            fontWeight: FontWeight.normal, // Text weight for the unselected tab
          ),
          indicatorColor: Colorconst.cwhite,
          tabs: [
            const Tab(text: 'SENT'),
            const Tab(text: 'UNSENT'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SentScreen(),
                const UnsentScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
