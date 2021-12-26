import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lenta_update_controller.dart';

abstract class BaseNewsPage extends StatelessWidget {
  late final LentaUpdateController lentaUpdateController;

  BaseNewsPage({Key? key}) : super(key: key) {
    lentaUpdateController = Get.put(LentaUpdateController());
  }

  @override
  Widget build(BuildContext context) {
    return GetX<LentaUpdateController>(
      builder: (controller) => build_(context),
    );
  }

  Widget build_(BuildContext context) {
    if (lentaUpdateController.updated.value) {
      return RefreshIndicator(
        child: listBuilder(context, lentaUpdateController),
        onRefresh: () => lentaUpdateController.reloadNews(),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget listBuilder(BuildContext context, controller) {
    return ListView.builder(
        itemCount: controller.news.length,
        itemBuilder: (BuildContext context, int index) {
          final item = controller.news[index];
          return buildListViewItem(item);
        });
  }

  Widget buildListViewItem(RssItem item);
}
