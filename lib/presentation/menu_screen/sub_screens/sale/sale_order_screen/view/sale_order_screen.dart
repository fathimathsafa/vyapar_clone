import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sale_order_screen/sub_screens/online_orders_screen/view/online_orders_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sale_order_screen/sub_screens/sale_orders_screen/view/sale_orders_screen.dart';

class SaleOrderScreen extends StatefulWidget {
  @override
  _SaleOrderScreenState createState() => _SaleOrderScreenState();
}

class _SaleOrderScreenState extends State<SaleOrderScreen>
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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colorconst.cBlack),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Orders",
          style: TextStyle(color: Colorconst.cBlack),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colorconst.cRed,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colorconst.cRed,
          tabs: [
            Tab(text: "Sale Orders"),
            Tab(text: "Online Orders"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SaleOrdersScreen(), // Screen with buttons and content for Sale Orders
          OnlineOrdersScreen(), // Screen content for Online Orders
        ],
      ),
    );
  }
}
