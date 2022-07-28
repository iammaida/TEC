import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/views/profile_screen.dart';
import 'package:tec/views/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SoildColor.scafoldbg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
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
                child: IndexedStack(
              index: _selectedIndexPage,
              children: [
                HomeScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ProfileScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin),
              ],
            )),
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changescreen: (int value) {
                setState(() {
                  _selectedIndexPage = value;
                });
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
      bottom: 0,
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
                      onPressed: () {},
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
