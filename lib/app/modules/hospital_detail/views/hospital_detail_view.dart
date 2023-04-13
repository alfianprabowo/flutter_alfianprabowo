import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';
import 'package:teramedik/app/utils/constants/layout_const.dart';
import 'package:teramedik/app/utils/constants/text_const.dart';
import 'package:teramedik/app/utils/widgets/appbar/MySliverAppBar.dart';
import 'package:teramedik/app/utils/widgets/icons/action_icon.dart';

import '../controllers/hospital_detail_controller.dart';

class HospitalDetailView extends GetView<HospitalDetailController> {
  const HospitalDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HospitalDetailController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  slivers: [
                    MySliverAppBar(
                      image: controller.hospital.value.image!,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Column(
                            children: [
                              Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(LayoutConstant.spaceL),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.hospital.value.name!,
                                        style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: LayoutConstant.spaceS),
                                      Text(
                                        controller.hospital.value.address!,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 10,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(LayoutConstant.spaceL),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: LayoutConstant.spaceL),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Call
                                        ActionIcon(
                                          icon: Icons.call,
                                          onTap: () {
                                            controller.makePhoneCall();
                                          },
                                        ),

                                        // Maps
                                        ActionIcon(
                                          icon: Icons.map_rounded,
                                          onTap: () {
                                            controller.getDirection();
                                          },
                                        ),

                                        // Email
                                        ActionIcon(
                                          icon: Icons.email,
                                          onTap: () {
                                            controller.sendEmail();
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: LayoutConstant.spaceXL),
                                    // Description
                                    const Text(
                                      TextConst.description,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: LayoutConstant.spaceM),
                                    Text(
                                      controller.hospital.value.description!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
}
