import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/favorites/data/dto/composiotion_dto.dart';
import 'package:aizere_app/utils/http_call_utils.dart';

class SearchRepository {
  SearchRepository() : _apiService = sl();

  final AuthorizedApiService _apiService;

  Future<List<CompositionDto>> searchBook(Map<String, dynamic> params) async {
    return safeApiCallList(
      _apiService.searchBooksByName(params),
      CompositionDto.fromJsonList,
    );
  }
}
