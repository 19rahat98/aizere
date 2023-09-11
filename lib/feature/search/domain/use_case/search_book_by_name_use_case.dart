import 'package:aizere_app/common/core/core_use_case.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/favorites/domain/entity/composition_entity.dart';
import 'package:aizere_app/feature/search/data/repository/search_repository.dart';

/// Праверка на то что есть ли у юзера токен
class SearchBookByNameUseCase
    extends CoreFutureUseCase<String, List<CompositionEntity>> {
  SearchBookByNameUseCase() : _launcherRepository = sl();

  final SearchRepository _launcherRepository;

  @override
  Future<List<CompositionEntity>> execute(String param) async {
    final requestData = {'search': param};

    /// запрашиваем, авторизован ли пользователь в приложении
    final response = await _launcherRepository.searchBook(requestData);

    return CompositionEntity.fromJsonList(response);
  }
}
