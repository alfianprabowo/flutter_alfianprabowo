import 'package:get/get.dart';
import 'package:teramedik/app/data/remote/hospital_detail_response.dart';

abstract class HospitalDetailProviderImpl {
  Future<Response<HospitalDetailResponse>> getHospitalDetail({
    required String path,
  });
}
