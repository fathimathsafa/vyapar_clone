import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_item.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/add_sale.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/sale_list.dart';
import 'package:vyapar_clone/repository/app_data/database/db.dart';



class HomeScreen extends StatelessWidget {

final Repository repository = Repository();  
  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.put(HomeController(repository: repository));
    return Obx(
      () {
        int index  = _controller.screenIndex.value;
         if(index==0){

          return SaleListScreen();
         }
         else if(index==1){
          return AddSaleInvoiceScreen();
         }
         else if(index==2){
          return AddItemSaleScreen();
         }
         
         else{
          return Center(child: Text("No Widget found"));
         }
      }
    );
  }
}