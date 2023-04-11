import 'package:get/get.dart';
import 'package:teramedik/app/data/models/hospital.dart';
import 'package:teramedik/app/data/remote/hospital_detail_response.dart';
import 'package:teramedik/app/modules/hospital_detail/repositories/hospital_detail_repository.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final HospitalDetailResponse hospitalDetailResponse =
        await hospitalDetailRepository.getHospitalDetail(hospitalId);
    hospital.value = hospitalDetailResponse.data!;

    isLoading(false);
    update();
  }

  Future<void> makePhoneCall(phone) async {
    var url = Uri.parse(phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> sendEmail(email) async {
    var params = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch $params';
    }
  }

  Future<void> getDirection(email) async {
    var params = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch $params';
    }
  }
}
