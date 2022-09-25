import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/componenets/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/views/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.tecrobat.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.welcome,
                  style: textTheme.headline4,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, size, textTheme);
              },
              child: const Text("بزن بریم"),
            ),
          ),
        ],
      )),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print(value +
                            " isEmail is= " +
                            isEmail(value).toString());
                      },
                      style: textTheme.headline6,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "techblog@gmail.com",
                          hintStyle: textTheme.headline6),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        Navigator.pop(context);
                        _activateCodeBottomSheet(context, size, textTheme);
                      }),
                      child: const Text("ادامه")),
                ],
              )),
            ),
          );
        }));
  }
}

Future<dynamic> _activateCodeBottomSheet(
    BuildContext context, Size size, TextTheme textTheme) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activateCode,
                  style: textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      print(value +
                          " isEmail is= " +
                          isNumeric(value).toString());
                    },
                    style: textTheme.headline6,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "******", hintStyle: textTheme.headline6),
                  ),
                ),
                ElevatedButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const MyCats();
                        },
                      ));
                    }),
                    child: const Text("ادامه")),
              ],
            )),
          ),
        );
      }));
}
