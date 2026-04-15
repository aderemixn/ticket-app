import 'package:get/get.dart';

class ButtomNavController extends GetxController {
  //RxInt
  var selectedIndex = 0.obs;
  
  void onItemTapped(int index) {
    print("my index val $index");
    selectedIndex.value = index;
  }

  
}