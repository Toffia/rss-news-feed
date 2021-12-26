import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api/news_api.dart';
import 'provider.dart';

abstract class BaseNewsPage extends StatelessWidget {
  const BaseNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LentaUpdateProvider(),
      builder: (context, child) => build_(context),
    );
  }

  Widget build_(BuildContext context) {
    if (context.watch<LentaUpdateProvider>().updated) {
      return RefreshIndicator(
        child: listBuilder(context, context.watch<LentaUpdateProvider>()),
        onRefresh: () => context.read<LentaUpdateProvider>().reloadNews(),
      );
    } else {
      context.read<LentaUpdateProvider>().loadNews();
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget listBuilder(BuildContext context, updateProvider) {
    return ListView.builder(
        itemCount: updateProvider.news.length,
        itemBuilder: (BuildContext context, int index) {
          final item = updateProvider.news[index];
          return buildListViewItem(item);
        });
  }

  Widget buildListViewItem(RssItem item);
}
