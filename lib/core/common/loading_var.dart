import 'package:get/get.dart';

var isLoading = false.obs;

void setLoadingValue(value){
  isLoading.value = value;
}