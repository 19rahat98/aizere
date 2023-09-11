class ClassComposition {
  int? grade;
  String? title;
  String? name;
  int? id;
  String? link;
  String? img;
  String? textSynthesis;

  ClassComposition({
    this.grade,
    this.title,
    this.id,
    this.name,
    this.link,
    this.img,
    this.textSynthesis,
  });

  ClassComposition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title_ru'];
    link = json['link_ru'];
    name = json['author_ru'];
    grade = json['class_number'];
    img = json['img'];
    textSynthesis = json['text_ru'];
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
