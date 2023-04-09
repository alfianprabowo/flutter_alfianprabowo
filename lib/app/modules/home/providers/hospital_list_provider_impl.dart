import 'package:get/get.dart';
import 'package:teramedik/app/data/remote/hospital_list_response.dart';

abstract class HospitalListProviderImpl {
  Future<Response<HospitalListResponse>> getHospitalList({
    required String path,
    Map<String, dynamic>? query,
  });
}
