import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/utils/http_call_utils.dart';

class LibraryRepository {
  LibraryRepository() : _apiService = sl();

  final AuthorizedApiService _apiService;

  Future<List<ClassComposition>> getClassLib(params) async {
    return safeApiCallList(
      _apiService.getClassLib(params),
      (response) {
        final List<ClassComposition> classCompositions = response
            .map((data) => ClassComposition.fromJson(data))
            .toList();
        return classCompositions;
      },
    );
  }
}
