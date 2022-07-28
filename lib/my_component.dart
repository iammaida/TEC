import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SoildColor.dividerColor,
      thickness: 1.5,
      endIndent: size.width / 6,
      indent: size.width / 6,
    );
  }
}
