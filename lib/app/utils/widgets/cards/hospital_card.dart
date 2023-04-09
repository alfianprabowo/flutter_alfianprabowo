import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teramedik/app/data/models/hospital.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';
import 'package:teramedik/app/utils/constants/layout_const.dart';

class HospitalCard extends StatelessWidget {
  final Hospital hospital;
  final VoidCallback onTap;

  const HospitalCard({
    Key? key,
    required this.hospital,
    required this.onTap,
  }) : super(key: key);

  gridView() {
    return Container(
      height: 180,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Material(
        child: InkWell(
          onTap: onTap,
          splashColor: primaryColor,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://img.etimg.com/thumb/width-1200,height-900,imgsize-16400,resizemode-1,msid-92641715/industry/healthcare/biotech/healthcare/care-acquires-indores-specialty-hospital-chl.jpg",
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
              const SizedBox(height: LayoutConstant.spaceM),
              Padding(
                padding: const EdgeInsets.all(LayoutConstant.spaceM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital.name!,
                      maxLines: 2,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: LayoutConstant.spaceS),
                    Text(
                      hospital.address!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  listView() {
    return Container(
      height: 250,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            hospital.image!,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(LayoutConstant.spaceM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hospital.name!,
              maxLines: 2,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceS),
            Text(
              hospital.address!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return gridView();
  }
}
