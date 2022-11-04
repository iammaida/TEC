import 'package:flutter/material.dart';
import 'package:tec/componenets/my_colors.dart';
import 'package:tec/componenets/my_component.dart';
import 'package:tec/componenets/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
        padding: const EdgeInsets.only(top: 24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage(Assets.icons.avatar.path),
            height: 100,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(Assets.icons.bluePen.path),
                color: SoildColor.seeMore,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                MyStrings.editProfileImage,
                style: textTheme.headline3,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
          Text(
            " مائده عابدی",
            style: textTheme.headline4,
          ),
          Text(
            " maedehabedi78@gmail.com",
            style: textTheme.headline4,
          ),
          const SizedBox(
            height: 50,
          ),
          TecDivider(size: size),
          InkWell(
            splashColor: SoildColor.primeriColor,
            onTap: () {},
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavariteBlog,
                  style: textTheme.headline4,
                ),
              ),
            ),
          ),
          TecDivider(size: size),
          InkWell(
            splashColor: SoildColor.primeriColor,
            onTap: () {},
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.myFavaritePodcast,
                  style: textTheme.headline4,
                ),
              ),
            ),
          ),
          TecDivider(size: size),
          InkWell(
            splashColor: SoildColor.primeriColor,
            onTap: () {},
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  MyStrings.logOut,
                  style: textTheme.headline4,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ]),
      ),
    );
  }
}
