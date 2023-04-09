import 'package:get/get.dart';
import 'package:teramedik/app/data/remote/hospital_detail_response.dart';
import 'package:teramedik/app/modules/hospital_detail/providers/hospital_detail_provider.dart';
import 'package:teramedik/app/utils/network/index.dart';
import 'package:teramedik/app/utils/services/index.dart';

import 'hospital_detail_respository_impl.dart';

class HospitalDetailRepository extends BaseRepository<HospitalDetailProvider>
    implements HospitalDetailRepositoryImpl {
  HospitalDetailRepository() : super(provider: HospitalDetailProvider());

  @override
  Future<HospitalDetailResponse> getHospitalDetail(dynamic hospitalId) async {
    final Response<HospitalDetailResponse> response =
        await provider.getHospitalDetail(
      path: Url.hospitalDetail(hospitalId),
    );
    if (response.status.hasError) {
      return Future<HospitalDetailResponse>.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
