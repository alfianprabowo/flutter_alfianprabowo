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
                  imageUrl: hospital.image!,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: const Alignment(0.0, 1.5),
                        begin: const Alignment(0.0, -1),
                        colors: <Color>[
                          const Color(0x8A000000),
                          Colors.black.withOpacity(0.0),
                        ],
                      ),
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
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: LayoutConstant.spaceS),
                        Text(
                          hospital.address!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: onTap,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 40,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
