import 'package:flutter/material.dart';
import 'package:tec/componenets/my_colors.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/views/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.images.splash.path),
                  height: 64,
                ),
                const SizedBox(
                  height: 32,
                ),
                const SpinKitFadingCube(
                  color: SoildColor.primeriColor,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
