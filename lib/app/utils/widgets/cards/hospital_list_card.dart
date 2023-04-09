import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teramedik/app/data/models/hospital.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';
import 'package:teramedik/app/utils/constants/layout_const.dart';

class HospitalListCard extends StatelessWidget {
  final Hospital hospital;
  final VoidCallback onTap;

  const HospitalListCard({
    Key? key,
    required this.hospital,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        splashColor: primaryColor,
        child: Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://img.etimg.com/thumb/width-1200,height-900,imgsize-16400,resizemode-1,msid-92641715/industry/healthcare/biotech/healthcare/care-acquires-indores-specialty-hospital-chl.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.softLight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(LayoutConstant.spaceM),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        backgroundBlendMode: BlendMode.hardLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(LayoutConstant.spaceL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            hospital.name!,
                            maxLines: 2,
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: LayoutConstant.spaceS),
                          Text(
                            hospital.address!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     IconButton(
                    //       onPressed: onTap,
                    //       icon: const Icon(
                    //         Icons.arrow_forward,
                    //         size: 40,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
