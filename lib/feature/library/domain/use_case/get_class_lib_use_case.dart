import 'package:aizere_app/common/core/core_use_case.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/feature/library/data/repository/library_repository.dart';

class GetClassLibraryUseCase extends CoreFutureUseCase<ClassLibParamEntity, ClassComposition> {
  GetClassLibraryUseCase() : _libraryRepository = sl();

  final LibraryRepository _libraryRepository;

  @override
  Future<ClassComposition> execute(ClassLibParamEntity params) async {
    return await _libraryRepository.getClassLib(params.toJson());
  }
}

class ClassLibParamEntity {
  int? grade;
  int? page;

  ClassLibParamEntity({this.grade, this.page});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class'] = grade;
    data['page'] = page;
    return data;
  }
}