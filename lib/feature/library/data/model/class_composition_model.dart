class ClassComposition {
  int? grade;
  String? title;
  String? bodyText;
  String? name;
  int? id;
  String? link;
  String? img;

  ClassComposition({this.grade, this.title});

  ClassComposition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title_ru'];
    link = json['link_ru'];
    name = json['author_ru'];
    grade = json['class_number'];
    img = json['img'];
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
