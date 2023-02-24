import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/componenets/my_component.dart';
import 'package:tec/contoroller/list_article_controller.dart';
import 'package:tec/contoroller/single_article_controller.dart';
import 'package:tec/views/main_screen/single.dart';

class ArticleListScreen extends StatelessWidget {
  ListArticleController articleController = Get.put(ListArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  String title;
  ArticleListScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ok');
    var TextTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: articleController.articleList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    singleArticleController.getArticlrInfo(
                        articleController.articleList[index].id!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 3,
                          height: Get.height / 6,
                          child: CachedNetworkImage(
                            imageUrl:
                                articleController.articleList[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              );
                            },
                            placeholder: (context, url) {
                              return const loading();
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 2,
                              child: Text(
                                articleController.articleList[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  articleController.articleList[index].author!,
                                  style: TextTheme.bodySmall,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "${articleController.articleList[index].view!}بازدید ",
                                  style: TextTheme.bodySmall,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
