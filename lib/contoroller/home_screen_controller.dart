import 'package:get/get.dart';
import 'package:tec/componenets/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/poster_model.dart';
import 'package:tec/models/podcasts_model.dart';
import 'package:tec/models/tag_model.dart';
import 'package:tec/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    response.data['top_visited'].forEach((element) {
      topVisitedList.add(ArticleModel.fromJson(element));
    });

    response.data['top_podcasts'].forEach((element) {
      topPodcasts.add(PodcastModel.fromJson(element));
    });

    response.data['tags'].forEach((element) {
      tagList.add(TagModel.fromJson(element));
    });

    poster.value = PosterModel.fromJson(response.data['poster']);

    loading.value = false;
  }
}
