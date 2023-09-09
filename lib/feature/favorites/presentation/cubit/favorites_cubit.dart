import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/favorites/data/repository/favorites_repository.dart';
import 'package:aizere_app/feature/favorites/domain/entity/composition_entity.dart';
import 'package:aizere_app/mixins/request_worker_mixin.dart';
import 'package:aizere_app/utils/exeption/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoritesCubit extends Cubit<FavoriteState> with CoreRequestWorkedMixin {
  FavoritesCubit()
      : _repository = sl(),
        super(FavoriteInitState());

  late List<CompositionEntity> favList;
  final FavoritesRepository _repository;

  Future<void> addToFavorites(int id) async {
    final request = _repository.addCompositionToFavList(id);

    await launchWithError<void, HttpRequestException>(
      request: request,
      loading: (state) => emit(
        FavoriteInitState(),
      ),
      resultData: (result) {
        loadFavorites();
      },
      errorData: (errorData) {
        emit(
          FavoriteErrorState(errorData.message ?? GlobalConstant.empty),
        );
      },
    );
  }

  Future<void> removeFromFavorites(int id) async {
    await _repository.addCompositionToFavList(id);
    await loadFavorites();
  }

  Future<void> loadFavorites() async {
    final request = _repository.getFavoritesList();

    await launchWithError<List<CompositionEntity>, HttpRequestException>(
      request: request,
      loading: (state) => emit(
        FavoriteInitState(),
      ),
      resultData: (result) {
        emit(
          FavoriteCommonState(list: result),
        );
      },
      errorData: (errorData) {
        emit(
          FavoriteErrorState(errorData.message ?? GlobalConstant.empty),
        );
      },
    );
  }
}
