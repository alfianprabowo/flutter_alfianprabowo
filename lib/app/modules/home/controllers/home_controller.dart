import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teramedik/app/data/models/hospital.dart';
import 'package:teramedik/app/data/remote/hospital_list_response.dart';
import 'package:teramedik/app/modules/home/repositories/hospital_list_repository.dart';
import 'package:teramedik/app/routes/app_pages.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeController extends GetxController {
  final HospitalListRepository hospitalListRepository;

  HomeController({
    required this.hospitalListRepository,
  });

  final isGridView = true.obs;
  final viewIcon = const Icon(Icons.list).obs;

  final hospitalList = <Hospital>[].obs;
  final ScrollController scrollController = ScrollController();
  final limit = 20.obs;
  final isLoading = true.obs;
  final loadMore = false.obs;

  final totalItems = 0.obs;
  final currentPage = 1.obs;
  final totalPages = 0.obs;
  final isLastPage = false.obs;

  final version = "".obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    getVersion();
  }

  @override
  void onReady() {
    super.onReady();
    loadMoreData();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  getData() async {
    final HospitalListResponse response = await hospitalListRepository.getHospitalList(
      query: <String, dynamic>{
        'page': currentPage.value,
        'results': limit,
      },
    );
    final bool isDataEmpty = response.hospital!.isEmpty;
    if (isDataEmpty) {
      isLastPage(true);
      loadMore(false);
    } else {
      hospitalList.addAll(response.hospital!);
      totalItems.value = response.total!;
      currentPage.value++;
      totalPages.value = response.lastPage!;
      isLoading(false);
      update();
    }
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

  loadMoreData() async {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        loadMore(true);
        if (hospitalList.length == totalItems.value) {
          isLastPage(true);
          loadMore(false);
        } else {
          await getData();
        }
        loadMore(false);
      }
    });
  }

  toHospitalDetail({hospitalId}) async {
    Get.toNamed(
      Routes.HOSPITAL_DETAIL,
      arguments: hospitalId,
    );
  }

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version(packageInfo.version);
  }
}
