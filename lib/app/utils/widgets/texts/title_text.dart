import 'package:flutter/material.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';

class TitleText extends StatelessWidget {
  final String? text;

  const TitleText({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        color: primaryColor,
        fontSize: 16,
      ),
    );
  }
}
