class ClassComposition {
  int? grade;
  int? page;
  String? bodyText;
  String? name;

  ClassComposition({this.grade, this.page});

  ClassComposition.fromJson(Map<String, dynamic> json) {
    grade = json['class'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class'] = grade;
    data['page'] = page;
    return data;
  }
}

