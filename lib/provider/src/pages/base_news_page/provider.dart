import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app1/provider/src/api/news_api.dart';

class LentaUpdateProvider extends ChangeNotifier {
  List<RssItem>? news;
  bool updated = false;

  Future<void> loadNews() async {
    updated = false;

    try {
      news = await LentaLastNewsProvider().getNews();
      updated = true;
      notifyListeners();
    } on RssNewsException {
      print("Уппссс!");
      notifyListeners();
    }
  }

  Future<void> reloadNews() async {
    loadNews();
  }
}
