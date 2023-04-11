import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';

class MySliverAppBar extends StatelessWidget {
  final String? image;

  const MySliverAppBar({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: image != null
            ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.fill,
              )
            : Image.asset(
                "assets/images/image1.webp",
                fit: BoxFit.fill,
              ),
      ),
      backgroundColor: Colors.blue[50],
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: primaryColor,
        ),
      ),
      pinned: true,
      snap: false,
      floating: true,
    );
  }
}
