import 'package:dart_rss/domain/rss_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/provider/src/widgets/last_news_item_widget.dart';

import 'base_news_page/base_news_page.dart';
import '../widgets/last_news_item_widget.dart';

class LastNewsPage extends BaseNewsPage {
  const LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget buildListViewItem(RssItem item) {
    return LastNewsItemWidget(item: item);
  }
}
