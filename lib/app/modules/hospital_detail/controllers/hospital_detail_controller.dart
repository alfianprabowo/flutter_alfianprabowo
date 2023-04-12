import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teramedik/app/data/models/hospital.dart';
import 'package:teramedik/app/data/remote/hospital_detail_response.dart';
import 'package:teramedik/app/modules/hospital_detail/repositories/hospital_detail_repository.dart';
import 'package:teramedik/app/utils/constants/layout_const.dart';
import 'package:teramedik/app/utils/constants/text_const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';

class HospitalDetailController extends GetxController {
  HospitalDetailRepository hospitalDetailRepository;

  dynamic hospitalId = Get.arguments;

  HospitalDetailController({
    required this.hospitalDetailRepository,
  });

  final hospital = const Hospital().obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    initHospital(hospitalId);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initHospital(dynamic hospitalId) async {
    isLoading(true);
    final HospitalDetailResponse hospitalDetailResponse = await hospitalDetailRepository.getHospitalDetail(hospitalId);
    hospital.value = hospitalDetailResponse.data!;

    isLoading(false);
    update();
  }

  Future<void> makePhoneCall() async {
    var phone = Uri(
      scheme: 'tel',
      path: hospital.value.phone!,
    );
    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  Future<void> sendEmail() async {
    var params = Uri(
      scheme: 'mailto',
      path: hospital.value.email!,
    );
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch $params';
    }
  }

  Future<void> getDirection() async {
    var coordinates = Coords(
      double.parse(hospital.value.lat!),
      double.parse(hospital.value.lng!),
    );

    try {
      final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;

      Get.bottomSheet(
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(LayoutConstant.spaceL),
                  child: Text(TextConst.openWithApp),
                ),
                for (AvailableMap map in availableMaps)
                  ListTile(
                    onTap: () => map.showDirections(
                      destination: coordinates,
                    ),
                    title: Text(map.mapName),
                    leading: SvgPicture.asset(
                      map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
