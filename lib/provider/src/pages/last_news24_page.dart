import 'package:dart_rss/domain/rss_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/provider/src/api/news_api.dart';

import 'base_news_page/base_news_page.dart';
import '../widgets/last_news24_item_widget.dart';

class LastNews24Page extends BaseNewsPage {
  const LastNews24Page({Key? key}) : super(key: key);

  @override
  Widget buildListViewItem(RssItem item) {
    return LastNews24ItemWidget(item: item);
  }
}
