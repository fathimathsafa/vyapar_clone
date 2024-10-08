import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_orders/subscreens/manage_online_orders/view/manage_online_orders.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/manage_orders/subscreens/manage_sale_orders/view/manage_sale_orders.dart';

class ManageOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colorconst.cBlack,
                )),
            title: Text('Manage Orders'),
            bottom: const TabBar(
              labelColor: Colorconst.cRed,
              unselectedLabelColor: Colorconst.cGrey,
              indicatorColor: Colorconst.cRed,
              tabs: [
                Tab(text: "Sale Orders"),
                Tab(
                  text: "Online Oreders",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ManageSaleOrders(),
              ManageOnlineOrders(),
            ],
          ),
        ),
      ),
    );
  }
}
