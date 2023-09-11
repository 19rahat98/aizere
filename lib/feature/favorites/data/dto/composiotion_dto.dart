class CompositionDto {
  CompositionDto({
    this.grade,
    this.title,
    this.id,
    this.name,
    this.link,
    this.img,
    this.textSynthesis,
  });

  final int? id;
  final int? grade;
  final String? title;
  final String? name;
  final String? link;
  final String? img;
  final String? textSynthesis;

  factory CompositionDto.fromJson(Map<String, dynamic> json) => CompositionDto(
        id: json['id'] as int?,
        title: json['title_ru'] as String?,
        link: json['link_ru'] as String?,
        name: json['author_ru'] as String?,
        grade: json['class_number'] as int?,
        img: json['img'] as String?,
        textSynthesis: json['text_ru'] as String?,
      );

  static List<CompositionDto> fromJsonList(List<dynamic>? jsonList) {
    final valueList = jsonList?.map(
      (dynamic json) => CompositionDto.fromJson(json as Map<String, dynamic>),
    );
    return valueList?.toList() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title_ru'] = title;
    data['link_ru'] = link;
    data['author_ru'] = name;
    data['class_number'] = grade;
    data['img'] = img;
    return data;
  }
}
