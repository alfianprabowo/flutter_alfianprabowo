import 'package:teramedik/app/data/remote/hospital_list_response.dart';

abstract class HospitalListRepositoryImpl {
  Future<HospitalListResponse> getHospitalList({Map<String, dynamic>? query});
}
