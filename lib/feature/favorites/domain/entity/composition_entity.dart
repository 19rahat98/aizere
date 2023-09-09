import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/feature/favorites/data/dto/composiotion_dto.dart';

class CompositionEntity {
  CompositionEntity({
    required this.id,
    this.grade,
    required this.title,
    required this.name,
    required this.link,
    required this.img,
    required this.textSynthesis,
  });

  factory CompositionEntity.fromDto(CompositionDto dto) => CompositionEntity(
        id: dto.id ?? 0,
        grade: dto.grade,
        title: dto.title ?? GlobalConstant.empty,
        name: dto.name ?? GlobalConstant.empty,
        link: dto.link ?? GlobalConstant.empty,
        img: dto.img ?? GlobalConstant.empty,
        textSynthesis: dto.textSynthesis ?? GlobalConstant.empty,
      );

  static List<CompositionEntity> fromJsonList(List<CompositionDto> jsonList) {
    return jsonList.map(CompositionEntity.fromDto).toList();
  }

  final int id;
  final int? grade;
  final String title;
  final String name;
  final String link;
  final String img;
  final String textSynthesis;
}
