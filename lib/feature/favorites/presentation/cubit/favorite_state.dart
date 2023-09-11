part of 'favorites_cubit.dart';

abstract class FavoriteState extends Equatable {}

class FavoriteInitState extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoriteErrorState extends FavoriteState {
  FavoriteErrorState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [];
}

class FavoriteCommonState extends FavoriteState {
  FavoriteCommonState({
    this.list = const [],
    this.isLoading = false,
  });

  final bool isLoading;
  final List<CompositionEntity> list;

  @override
  List<Object?> get props => [
        list,
        isLoading,
      ];
}
