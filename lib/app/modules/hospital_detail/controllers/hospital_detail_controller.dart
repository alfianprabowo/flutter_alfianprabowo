import 'package:get/get.dart';
import 'package:teramedik/app/data/models/hospital.dart';
import 'package:teramedik/app/data/remote/hospital_detail_response.dart';
import 'package:teramedik/app/modules/hospital_detail/repositories/hospital_detail_repository.dart';

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
}
