import 'package:get/get.dart';
import 'package:teramedik/app/modules/hospital_detail/providers/hospital_detail_provider.dart';
import 'package:teramedik/app/modules/hospital_detail/repositories/hospital_detail_repository.dart';

import '../controllers/hospital_detail_controller.dart';

class HospitalDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalDetailProvider>(() => HospitalDetailProvider());
    Get.lazyPut<HospitalDetailRepository>(() => HospitalDetailRepository());

    Get.lazyPut<HospitalDetailController>(
      () => HospitalDetailController(hospitalDetailRepository: Get.find()),
    );
  }
}
