import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News'),
        ),
        body: GetBuilder<DashboardController>(
          builder: (controller) {
            if (controller.newsResModel == null && controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: controller.newsResModel!.results!.length,
                itemBuilder: (context, index) {
                  var data = controller.newsResModel!.results![index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.imageUrl != null
                        ? Image.network(
                            data.imageUrl.toString())
                        : Container(),
                         Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            data.title.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            data.description.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
