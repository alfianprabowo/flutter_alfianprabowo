import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teramedik/app/utils/constants/color_const.dart';
import 'package:teramedik/app/utils/constants/layout_const.dart';
import 'package:teramedik/app/utils/constants/text_const.dart';
import 'package:teramedik/app/utils/widgets/cards/hospital_grid_card.dart';
import 'package:teramedik/app/utils/widgets/cards/hospital_list_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget _buildList(HomeController controller) {
    return Obx(
      () => controller.isGridView.value
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 180,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.hospitalList.length,
              itemBuilder: (BuildContext context, int index) {
                return HospitalGridCard(
                  onTap: () {
                    controller.toHospitalDetail(hospitalId: controller.hospitalList[index].id);
                  },
                  hospital: controller.hospitalList[index],
                );
              },
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.hospitalList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: HospitalListCard(
                    hospital: controller.hospitalList[index],
                    onTap: () {
                      controller.toHospitalDetail(hospitalId: controller.hospitalList[index].id);
                    },
                  ),
                );
              }),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            TextConst.teramedik,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.changeView();
              },
              icon: controller.viewIcon.value,
            ),
          ],
        ),
        body: controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: controller.scrollController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                _buildList(controller),
                                controller.loadMore.value
                                    ? const CircularProgressIndicator()
                                    : Container(
                                        child: controller.isLastPage.value
                                            ? const Padding(
                                                padding: EdgeInsets.all(LayoutConstant.spaceL),
                                                child: Text(
                                                  TextConst.allDataDisplayed,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  LayoutConstant.spaceXL,
                                  0,
                                ),
                                child: Text(
                                  'Ver. ${controller.version.value}',
                                  style: const TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
