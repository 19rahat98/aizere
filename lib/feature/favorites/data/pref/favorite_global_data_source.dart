import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// data source для работы с типом календаря и шапкой на главных страницах
class CoreFavoriteDataSource {
  CoreFavoriteDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  /// записоваем список стрингов в память
  Future<void> saveToFavorites(List<String> value) async {
    final prefs = await _sharedPreferences;
    await prefs.setStringList(
      GlobalPrefConstant.prefFavoritesList,
      value,
    );
  }

  /// получаем список
  Future<List<String>> getFavorites() async {
    final prefs = await _sharedPreferences;
    return prefs.getStringList(
      GlobalPrefConstant.prefFavoritesList,
    ) ?? [];
  }
}
