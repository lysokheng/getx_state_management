import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/counter_controller.dart';
import 'package:getx_state_management/controller/home_page_controller.dart';

class CounterGetXScreen extends StatelessWidget {
  CounterGetXScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomePageController());
  final controller1 = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2 Controller'),
      ),
      body: Column(
        children: [
          Text('Controller 1'),
          GetX<HomePageController>(
              builder: (builder) => Text(
                    builder.counter1.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
          Text('Controller 2'),
          GetX<CounterController>(
              builder: (builder) => Text(
                    builder.counter.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
        ],
      ),
    );
  }
}
