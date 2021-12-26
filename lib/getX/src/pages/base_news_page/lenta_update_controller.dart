import 'package:get/get.dart';
import 'package:flutter_app1/getX/src/api/news_api.dart';

class LentaUpdateController extends GetxController {
  var news = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadNews();
  }

  var updated = false.obs;

  Future<void> loadNews() async {
    updated = false.obs;
    try {
      news.value = await LentaLastNewsProvider().getNews();
      updated.value = true;
    } on RssNewsException {
      print("Уппссс!");
    }
  }

  Future<void> reloadNews() async {
    loadNews();
  }
}
