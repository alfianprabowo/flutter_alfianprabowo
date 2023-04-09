import 'package:get/get.dart';
import 'package:teramedik/app/data/remote/hospital_detail_response.dart';
import 'package:teramedik/app/utils/services/index.dart';

import 'hospital_detail_provider_impl.dart';

class HospitalDetailProvider extends BaseProvider
    implements HospitalDetailProviderImpl {
  @override
  InternalFinalCallback<void> get onStart {
    httpClient.defaultDecoder =
        (dynamic val) => HospitalDetailResponse.fromJson(val);
    return super.onStart;
  }

  @override
  Future<Response<HospitalDetailResponse>> getHospitalDetail(
          {required String path}) =>
      get(
        path,
      );
}
