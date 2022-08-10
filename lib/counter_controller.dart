import 'package:get/get.dart';

class CounterController extends GetxController {
  Rx<int> counter = Rx(0);

  void increment() {
    counter.value++;
  }
}