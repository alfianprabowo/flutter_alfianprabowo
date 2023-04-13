import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';
import 'package:teramedik/app/utils/constants/layout_const.dart';

class MySliverAppBar extends StatelessWidget {
  final String? image;

  const MySliverAppBar({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: image == ""
            ? const Center(
                child: Icon(
                  Icons.broken_image,
                  size: 80,
                ),
              )
            : CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(LayoutConstant.spaceL),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.broken_image,
                  size: 80,
                ),
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
