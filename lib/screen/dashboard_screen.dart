import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/dashboard_controller.dart';
import 'package:getx_state_management/screen/detail_screen.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardController controller = Get.put(DashboardController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });

    return completer.future.then<void>((_) {
      controller.fetchNews();
      setState(() {});
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

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
          return LiquidPullToRefresh(
            onRefresh: _handleRefresh,
            child: ListView.builder(
                itemCount: controller.newsResModel!.results!.length,
                itemBuilder: (context, index) {
                  var data = controller.newsResModel!.results![index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailScreen(
                          title: data.title!,
                          subTitle: data.description!,
                          imgURL: data.imageUrl));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data.imageUrl != null
                                ? CachedNetworkImage(
                                    imageUrl: data.imageUrl!,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                data.title.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                data.description.toString(),
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
