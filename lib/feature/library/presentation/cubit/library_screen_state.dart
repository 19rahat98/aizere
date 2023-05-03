part of 'library_screen_cubit.dart';

abstract class LibraryScreenState extends Equatable {
  const LibraryScreenState();

  @override
  List<Object?> get props => [];
}

class LibraryScreenCommonState extends LibraryScreenState {
  const LibraryScreenCommonState(
      {this.classCompositions, this.isLoading = false});

  final bool isLoading;
  final List<ClassComposition>? classCompositions;

  LibraryScreenCommonState copyWith({
    List<ClassComposition>? classCompositions,
    bool? isLoading,
  }) {
    return LibraryScreenCommonState(
      classCompositions: classCompositions ?? this.classCompositions,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        classCompositions
      ];
}

class LibraryScreenFailedState extends LibraryScreenState {}
