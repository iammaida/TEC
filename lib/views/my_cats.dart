import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/componenets/my_colors.dart';
import 'package:tec/componenets/my_component.dart';
import 'package:tec/componenets/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/data_models.dart';
import 'package:tec/models/fake_data.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.tecrobat.path,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    MyStrings.succesfulRegistering,
                    style: textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "نام و نام خانوادگی",
                      helperStyle: textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.chooseCat,
                    style: textTheme.headline4,
                  ),
                  //tag list
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      height: 85,
                      width: double.infinity,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.3,
                        ),
                        itemCount: tagList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedTags.contains(tagList[index])) {
                                  selectedTags.add(tagList[index]);
                                } else {
                                  print("${tagList[index]} has exsit");
                                }
                              });
                            },
                            child: Container(
                              child:
                                  MainTags(textTheme: textTheme, index: index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset(
                    Assets.images.a.path,
                    scale: 3,
                  ),

                  //selectedTags
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      height: 85,
                      width: double.infinity,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.2,
                        ),
                        itemCount: selectedTags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: SoildColor.surFace,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedTags[index].title,
                                      style: textTheme.headline4,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedTags.removeAt(index);
                                        });
                                      },
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
