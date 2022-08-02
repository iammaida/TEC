import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

import '../my_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            HomePagePoater(size: size, textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            HomePageSeeMoreArticle(
                bodyMargin: bodyMargin, textTheme: textTheme),
            HomePageBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            HomePageSeeMorePodcast(
                bodyMargin: bodyMargin, textTheme: textTheme),
            HomePageListPodcasts(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageListPodcasts extends StatelessWidget {
  const HomePageListPodcasts({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height / 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: podcastList.length,
          itemBuilder: ((context, index) {
            //podcast item
            return Padding(
              padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 8,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 4.44,
                    width: size.width / 2.5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image:
                                    NetworkImage(podcastList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      // height: size.height / 5.3,
                      width: size.width / 2.4,
                      child: Center(
                        child: Text(
                          podcastList[index].title,
                          style: textTheme.headline5,
                        ),
                      ))
                ],
              ),
            );
          }),
        ));
  }
}

class HomePageSeeMorePodcast extends StatelessWidget {
  const HomePageSeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.microphon.path),
            color: SoildColor.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodcasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height / 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: blogList.length,
          itemBuilder: ((context, index) {
            //blog item
            return Padding(
              padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 8,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: GradientColor.blogPostColor,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(blogList[index].views,
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
                      width: size.width / 2.4,
                      child: Text(
                        blogList[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            );
          }),
        ));
  }
}

class HomePageSeeMoreArticle extends StatelessWidget {
  const HomePageSeeMoreArticle({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
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
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(textTheme: textTheme, index: index),
            );
          })),
    );
  }
}

class HomePagePoater extends StatelessWidget {
  const HomePagePoater({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image:
                      Image(image: AssetImage(homePagePosterMap['AssetsImage']))
                          .image,
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                colors: GradientColor.homePosterCoverColor,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
        //textOnPoster
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap['Writer'] +
                        " - " +
                        homePagePosterMap['Date'],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(homePagePosterMap['view'],
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
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  homePagePosterMap['title'],
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headline1,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
