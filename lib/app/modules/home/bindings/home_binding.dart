import 'package:get/get.dart';
import 'package:teramedik/app/modules/home/providers/hospital_list_provider.dart';
import 'package:teramedik/app/modules/home/repositories/hospital_list_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalListProvider>(() => HospitalListProvider());
    Get.lazyPut<HospitalListRepository>(() => HospitalListRepository());

    Get.lazyPut<HomeController>(
      () => HomeController(hospitalListRepository: Get.find()),
    );
  }
}
