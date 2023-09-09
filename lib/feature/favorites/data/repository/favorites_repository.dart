import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/favorites/data/dto/composiotion_dto.dart';
import 'package:aizere_app/feature/favorites/domain/entity/composition_entity.dart';
import 'package:aizere_app/utils/http_call_utils.dart';

class FavoritesRepository {
  FavoritesRepository() : _apiService = sl();

  final AuthorizedApiService _apiService;

  Future<List<CompositionEntity>> getFavoritesList() async {
    return safeApiCallList(
      _apiService.getFavoritesList(),
      (jsonList) {
        final response = CompositionDto.fromJsonList(jsonList);
        return CompositionEntity.fromJsonList(response);
      },
    );
  }

  Future<void> addCompositionToFavList(int id) async {
    final param = {'book_id': id};
    return safeApiCallVoid(
      _apiService.addToFavoritesList(param),
    );
  }
}
