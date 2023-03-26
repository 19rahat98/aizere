import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/favorites/data/pref/favorite_global_data_source.dart';

/// репозиторий для работы с избранным списком
class CoreGlobalFavoritesRepository {
  CoreGlobalFavoritesRepository() : _favoriteDataSource = sl();

  final CoreFavoriteDataSource _favoriteDataSource;

  /// каждый раз перезаписоваем в SharedPreferences
  Future<void> writeDataToSP(List<String> value) =>
      _favoriteDataSource.saveToFavorites(value);

  /// получаем избранные список из SharedPreferences
  Future<List<String>> get getFavList => _favoriteDataSource.getFavorites();
}
