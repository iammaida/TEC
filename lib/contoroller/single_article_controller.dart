import 'package:get/get.dart';
import 'package:tec/componenets/api_constant.dart';
import 'package:tec/models/article_info_model.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/tag_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/views/main_screen/single.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagModel> tagList = RxList();
  RxList<ArticleModel> releatedList = RxList();

  @override
  onInit() {
    super.onInit();
  }

  getArticlrInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    loading.value = true;

    var userId = '';

    print(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagModel.fromJson(element));
    });

    releatedList.clear();
    response.data['related'].forEach((element) {
      releatedList.add(ArticleModel.fromJson(element));
    });
    Get.to(Single());
  }
}
