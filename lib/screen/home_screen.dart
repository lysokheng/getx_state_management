import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  var selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Get.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        title: const Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () {
                controller.changeLanguage();
              },
              icon: const Icon(Icons.language)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('username'.tr),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(child: TextField()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('password'.tr),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(child: TextField()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {
              Get.snackbar('Message', 'Login Successfully',
                  snackPosition: SnackPosition.TOP,
                  snackbarStatus: (state) => SnackbarStatus.OPENING,
                snackStyle: SnackStyle.GROUNDED,
                backgroundColor: Colors.greenAccent
              );
            }, child: Text('login'.tr)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.isDarkMode
              ? Get.changeTheme(ThemeData.light())
              : Get.changeTheme(ThemeData.dark());
        },
        child: Icon(
          selected ? Icons.dark_mode : Icons.light_mode,
        ),
      ),
    );
  }
}
