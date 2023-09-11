import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/feature/library/domain/use_case/get_class_lib_use_case.dart';
import 'package:aizere_app/mixins/request_worker_mixin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'library_screen_state.dart';

class LibraryScreenCubit extends Cubit<LibraryScreenState>
    with CoreRequestWorkedMixin {
  LibraryScreenCubit()
      : _getClassLibraryUseCase = sl(),
        super(const LibraryScreenCommonState());

  final GetClassLibraryUseCase _getClassLibraryUseCase;

  void fetchLibrary([int grade = 0]) async {
    final classLib = ClassLibParamEntity(grade + 1);
    final request = _getClassLibraryUseCase.execute(classLib);

    await launchWithError(
      request: request,
      resultData: (result) {
        emit(LibraryScreenCommonState(
          classCompositions: result,
          grade: grade,
        ));
      },
      errorData: (errorData) {
        emit(LibraryScreenFailedState());
      },
    );
  }
}
