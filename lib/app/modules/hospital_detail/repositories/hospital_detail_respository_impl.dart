import 'package:teramedik/app/data/remote/hospital_detail_response.dart';

abstract class HospitalDetailRepositoryImpl {
  Future<HospitalDetailResponse> getHospitalDetail(dynamic hospitalId);
}
