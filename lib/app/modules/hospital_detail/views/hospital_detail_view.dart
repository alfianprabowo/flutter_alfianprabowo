import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';
import 'package:teramedik/app/utils/constants/layout_const.dart';

import '../controllers/hospital_detail_controller.dart';

class HospitalDetailView extends GetView<HospitalDetailController> {
  const HospitalDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HospitalDetailController>(
      builder: (controller) => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              // child: Padding(
              //   padding: const EdgeInsets.all(LayoutConstant.spaceL),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         controller.hospital.value.name!,
              //         style: const TextStyle(
              //           fontSize: 12,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //       const SizedBox(height: LayoutConstant.spaceM),
              //       Text(
              //         controller.hospital.value.address!,
              //         maxLines: 2,
              //         style: const TextStyle(
              //           fontSize: 10,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //     ),
              //   ),
              // ),

              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CachedNetworkImage(
                          imageUrl:
                              "https://img.etimg.com/thumb/width-1200,height-900,imgsize-16400,resizemode-1,msid-92641715/industry/healthcare/biotech/healthcare/care-acquires-indores-specialty-hospital-chl.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(100),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(LayoutConstant.spaceL),
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
                      pinned: false,
                      snap: false,
                      floating: false,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.all(LayoutConstant.spaceL),
                                child: Column(
                                  children: [
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                    Text(
                                      controller.hospital.value.name!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
