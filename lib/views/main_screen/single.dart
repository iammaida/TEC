import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tec/componenets/my_colors.dart';
import 'package:tec/componenets/my_component.dart';
import 'package:tec/contoroller/home_screen_controller.dart';
import 'package:tec/contoroller/list_article_controller.dart';
import 'package:tec/contoroller/single_article_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/views/article_list_screen.dart';

class Single extends StatelessWidget {
  Single({Key? key}) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => singleArticleController.articleInfoModel.value.title == null
              ? SizedBox(height: Get.height, child: loading())
              : Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleController
                              .articleInfoModel.value.image!,
                          imageBuilder: (context, imageProvider) {
                            return Image(image: imageProvider);
                          },
                          placeholder: (context, url) {
                            return const loading();
                          },
                          errorWidget: (context, url, error) {
                            return Image.asset(Assets.images.programming.path);
                          },
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                      colors:
                                          GradientColor.singleAppBarGradient)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.bookmark_border_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        singleArticleController.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: textTheme.headline5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image(
                              height: 50,
                              image:
                                  Image.asset(Assets.icons.avatar.path).image),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArticleController
                                .articleInfoModel.value.author!,
                            style: textTheme.headline4,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArticleController
                                .articleInfoModel.value.createdAt!,
                            style: textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    HtmlWidget(
                      singleArticleController.articleInfoModel.value.content!,
                      textStyle: textTheme.headline4,
                      enableCaching: true,
                      onLoadingBuilder: ((context, element, loadingProgress) =>
                          const loading()),
                    ),
                    tags(textTheme),
                    simmilar(textTheme),
                  ],
                ),
        ),
      ),
    ));
  }

  Widget tags(textheme) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singleArticleController.tagList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                var tagId = singleArticleController.tagList[index].id!;
                await Get.find<ListArticleController>()
                    .getArticleListWithTagsId(tagId);
                String tagName = singleArticleController.tagList[index].title!;
                Get.to(ArticleListScreen(
                  title: tagName,
                  // title: tagName,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: Colors.grey),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        singleArticleController.tagList[index].title!,
                        style: textheme.headline2,
                      )),
                ),
              ),
            );
          })),
    );
  }

  Widget simmilar(textheme) {
    return SizedBox(
      height: Get.height / 3.5,
      child: ListView.builder(
          itemCount: singleArticleController.releatedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //blog item
            return GestureDetector(
              onTap: (() {
                singleArticleController.getArticlrInfo(
                    singleArticleController.releatedList[index].id);
              }),
              child: Padding(
                padding:
                    EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.height / 5.3,
                        width: Get.width / 2.4,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: singleArticleController
                                  .releatedList[index].image!,
                              imageBuilder: ((context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                    foregroundDecoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        gradient: LinearGradient(
                                            end: Alignment.topCenter,
                                            begin: Alignment.bottomCenter,
                                            colors:
                                                GradientColor.blogPostColor)),
                                  )),
                              placeholder: ((context, url) => const loading()),
                              errorWidget: ((context, url, error) => const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  )),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    singleArticleController
                                        .releatedList[index].author!,
                                    style: textheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        singleArticleController
                                            .releatedList[index].view!,
                                        style: textheme.subtitle1,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: Get.width / 2.4,
                        child: Text(
                          singleArticleController.releatedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          })),
    );
  }
}
