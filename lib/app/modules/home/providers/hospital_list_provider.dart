import 'package:get/get.dart';
import 'package:teramedik/app/data/remote/hospital_list_response.dart';
import 'package:teramedik/app/modules/home/providers/hospital_list_provider_impl.dart';
import 'package:teramedik/app/utils/services/base_provider.dart';

class HospitalListProvider extends BaseProvider
    implements HospitalListProviderImpl {
  @override
  InternalFinalCallback<void> get onStart {
    httpClient.defaultDecoder =
        (dynamic val) => HospitalListResponse.fromJson(val);
    return super.onStart;
  }

  @override
  Future<Response<HospitalListResponse>> getHospitalList(
          {required String path, Map<String, dynamic>? query}) =>
      get(
        path,
        query: query,
      );
}
