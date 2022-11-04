import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tec/componenets/my_colors.dart';
import 'package:tec/componenets/my_component.dart';
import 'package:tec/componenets/my_strings.dart';
import 'package:tec/contoroller/home_screen_controller.dart';
import 'package:tec/contoroller/single_article_controller.dart';
import 'package:tec/gen/assets.gen.dart';

import '../../models/fake_data.dart';

class Single extends StatefulWidget {
  const Single({Key? key}) : super(key: key);

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  void initState() {
    super.initState();
    singleArticleController.getArticlrInfo();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        singleArticleController.articleInfoModel.value.image!,
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
                                colors: GradientColor.singleAppBarGradient)),
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
                  style: textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                        height: 50,
                        image: Image.asset(Assets.icons.avatar.path).image),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      singleArticleController.articleInfoModel.value.author!,
                      style: textTheme.headline4,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      singleArticleController.articleInfoModel.value.createdAt!,
                      style: textTheme.caption,
                    ),
                  ],
                ),
              ),
              HtmlWidget(
                singleArticleController.articleInfoModel.value.content!,
                textStyle: textTheme.headline5,
                enableCaching: true,
                onLoadingBuilder: ((context, element, loadingProgress) =>
                    const loading()),
              ),
              tags(textTheme),
              homePageSeeMoreArticle(textTheme),
            ],
          ),
        ),
      ),
    ));
  }

  Widget tags(textTheme) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: MainTags(textTheme: textTheme, index: index),
            );
          })),
    );
  }

  Widget homePageSeeMoreArticle(textTheme) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.bluePen.path),
            color: SoildColor.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.relatedArticle,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }

  Widget topVisited(textTheme) {
    return SizedBox(
        height: Get.height / 3.5,
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topVisitedList.length,
            itemBuilder: ((context, index) {
              //blog item
              return Padding(
                padding: EdgeInsets.only(
                  right: index == 0 ? Get.width / 15 : 8,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height / 5.3,
                      width: Get.width / 2.4,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
                            placeholder: (context, url) => const loading(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: Colors.grey,
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                              foregroundDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gradient: LinearGradient(
                                    colors: GradientColor.blogPostColor,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.subtitle1),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        // height: size.height / 5.3,
                        width: Get.width / 2.4,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
