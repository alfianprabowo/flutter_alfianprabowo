import 'package:get/get.dart';
import 'package:teramedik/app/data/remote/hospital_list_response.dart';
import 'package:teramedik/app/modules/home/providers/hospital_list_provider.dart';
import 'package:teramedik/app/modules/home/repositories/hospital_list_repository_impl.dart';
import 'package:teramedik/app/utils/network/index.dart';
import 'package:teramedik/app/utils/services/index.dart';

class HospitalListRepository extends BaseRepository<HospitalListProvider>
    implements HospitalListRepositoryImpl {
  HospitalListRepository() : super(provider: HospitalListProvider());

  @override
  Future<HospitalListResponse> getHospitalList({
    Map<String, dynamic>? query,
  }) async {
    final Response<HospitalListResponse> response =
        await provider.getHospitalList(
      path: Url.hospitals,
      query: query,
    );
    if (response.status.hasError) {
      return Future<HospitalListResponse>.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
