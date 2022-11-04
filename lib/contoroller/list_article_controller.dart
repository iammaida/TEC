import 'package:get/get.dart';
import 'package:tec/componenets/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/services/dio_service.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    loading.value = true;
    // TODO get used from getStorange ApiConstant.getArticleList+userID
    var response = await DioService().getMethod(ApiConstant.getArticleList);

    response.data.forEach((element) {
      articleList.add(ArticleModel.fromJson(element));
    });

    loading.value = false;
  }
}
