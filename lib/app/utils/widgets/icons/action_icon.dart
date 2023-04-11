import 'package:flutter/material.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ActionIcon({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[50],
      shape: const CircleBorder(),
      child: InkWell(
        splashColor: primaryColor,
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Ink(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          height: 60,
          width: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: primaryColor,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
