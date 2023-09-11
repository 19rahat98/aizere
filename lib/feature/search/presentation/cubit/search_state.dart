part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchEmptyResultState extends SearchState {}

class SearchSuccessState extends SearchState {
  SearchSuccessState({
    required this.bookList,
  });

  final List<CompositionEntity> bookList;
}

class SearchHttpErrorState extends SearchState {
  SearchHttpErrorState(this.errorMessage);

  final String errorMessage;
}
