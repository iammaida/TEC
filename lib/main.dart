import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/views/main_screen.dart';
import 'package:tec/views/register_intro.dart';
import 'package:tec/views/splash_screen.dart';

import 'my_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SoildColor.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SoildColor.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi, no country code
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Dana',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SoildColor.posterTitle),
          headline5: TextStyle(
              fontFamily: 'Dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
          subtitle1: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SoildColor.posterSubTitle),
          bodyText1: TextStyle(
              fontFamily: 'Dana', fontSize: 13, fontWeight: FontWeight.w300),
          headline2: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          headline3: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SoildColor.seeMore),
          headline4: TextStyle(
              fontFamily: 'Dana',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: const MainScreen(),
    );
  }
}
