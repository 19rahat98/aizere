import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/favorites/data/repository/favorites_global_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoritesCubit extends Cubit<FavoriteState> {
  FavoritesCubit()
      : _repository = sl(),
        super(FavoriteState([]));

  final CoreGlobalFavoritesRepository _repository;
  late List<String> favList;

  Future<void> addToFavorites(String item) async {
    favList.add(item);
    await _saveFavorites();
  }
  Future<void> removeFromFavorites(String item) async {
    favList.remove(item);
    await _saveFavorites();
  }

  Future<void> removeAll() async {
    favList.clear();
    await _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    await _repository.writeDataToSP(favList);
    emit(FavoriteState(favList));
  }

  Future<void> loadFavorites() async {
    favList = await _repository.getFavList;
    emit(FavoriteState(favList));
  }
}
