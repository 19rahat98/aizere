import 'package:aizere_app/common/core/core_use_case.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/feature/library/data/repository/library_repository.dart';

class GetClassLibraryUseCase
    extends CoreFutureUseCase<ClassLibParamEntity, List<ClassComposition>> {
  GetClassLibraryUseCase() : _libraryRepository = sl();

  final LibraryRepository _libraryRepository;

  @override
  Future<List<ClassComposition>> execute(ClassLibParamEntity params) {
    return _libraryRepository.getClassLib(params.toJson());
  }
}

class ClassLibParamEntity {
  int grade;

  ClassLibParamEntity(this.grade);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class'] = grade;

    return data;
  }
}
