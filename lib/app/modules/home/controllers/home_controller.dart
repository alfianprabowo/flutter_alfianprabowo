import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teramedik/app/data/models/hospital.dart';
import 'package:teramedik/app/data/remote/hospital_list_response.dart';
import 'package:teramedik/app/modules/home/repositories/hospital_list_repository.dart';
import 'package:teramedik/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final HospitalListRepository hospitalListRepository;

  HomeController({
    required this.hospitalListRepository,
  });

  final isGridView = true.obs;
  final viewIcon = const Icon(Icons.list).obs;

  final hospitalList = <Hospital>[].obs;
  final ScrollController scrollController = ScrollController();
  final listLength = 20.obs;
  final loadMore = true.obs;
  final isLoading = false.obs;

  final totalItems = 0.obs;
  final currentPage = 1.obs;
  final itemPerPage = 4.obs;
  final totalPages = 0.obs;
  final quantity = 1.obs;
  final isLastPage = false.obs;

  @override
  void onInit() {
    super.onInit();
    initList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  initList() async {
    isLoading(true);
    final HospitalListResponse response =
        await hospitalListRepository.getHospitalList(
      query: <String, dynamic>{
        // 'page': currentPage.value,
        // 'page[size]': itemPerPage.value,
      },
    );
    hospitalList.addAll(response.hospital!);
    // debugPrint(response!.hospital!.length.toString());
    // hospitalList.addAll(response.hospital!);
    // listLength.value = hospitalList.length;
    // totalItems.value = response.meta!.totalItems!;
    // currentPage.value++;
    // itemPerPage.value = response.meta!.itemPerPage!;
    // totalPages.value = response.meta!.totalPages!;
    isLoading(false);
    update();
  }

  changeView() {
    if (isGridView.value) {
      isGridView(false);
      viewIcon.value = const Icon(Icons.grid_view);
    } else {
      isGridView(true);
      viewIcon.value = const Icon(Icons.list);
    }
  }

  getMoreData() async {}

  toHospitalDetail({hospitalId}) async {
    Get.toNamed(
      Routes.HOSPITAL_DETAIL,
      arguments: hospitalId,
      // transition: Transition.leftToRight,
    );
  }
}
