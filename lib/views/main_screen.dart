import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec/componenets/api_constant.dart';
import 'package:tec/componenets/my_colors.dart';
import 'package:tec/componenets/my_component.dart';
import 'package:tec/componenets/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/services/dio_service.dart';

import 'package:tec/views/profile_screen.dart';
import 'package:tec/views/home_screen.dart';
import 'package:tec/views/register_intro.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt _selectedIndexPage = 0.obs;

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    DioService().getMethod(ApiConstant.getHomeItems);
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
            backgroundColor: SoildColor.scafoldbg,
            child: Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Image.asset(
                    Assets.images.splash.path,
                    scale: 3,
                  )),
                  ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: textTheme.headline5,
                    ),
                    onTap: () {
                      _selectedIndexPage.value = 2;
                    },
                  ),
                  const Divider(
                    color: SoildColor.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      " درباره تک بلاگ",
                      style: textTheme.headline5,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: SoildColor.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      " اشتراک گذاری تک بلاگ",
                      style: textTheme.headline5,
                    ),
                    onTap: () async {
                      await Share.share(MyStrings.shareText);
                    },
                  ),
                  const Divider(
                    color: SoildColor.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      " تک بلاگ در گیت هاب",
                      style: textTheme.headline5,
                    ),
                    onTap: () {
                      mylaunchUrl(MyStrings.urlTechBlogGitHub);
                    },
                  ),
                ],
              ),
            )),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SoildColor.scafoldbg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image(
                  height: size.height / 13.6,
                  image: AssetImage(Assets.images.splash.path)),
              const Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: _selectedIndexPage.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ],
              ),
            )),
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changescreen: (int value) {
                _selectedIndexPage.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changescreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changescreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColor.bottonNavBackground,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient:
                    const LinearGradient(colors: GradientColor.bottonNav)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: (() => changescreen(0)),
                      icon: ImageIcon(
                        AssetImage(Assets.icons.home.path),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      icon: ImageIcon(
                        AssetImage(Assets.icons.w.path),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: (() => changescreen(1)),
                      icon: ImageIcon(
                        AssetImage(Assets.icons.user.path),
                        color: Colors.white,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
