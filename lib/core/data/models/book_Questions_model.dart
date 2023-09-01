class bookQuestionsModel {
  String? id;
  String? content;
  String? reference;
  Null? term;
  String? collage;
  String? specialization;
  Options? options;
  String? isTrue;

  bookQuestionsModel(
      {this.id,
        this.content,
        this.reference,
        this.term,
        this.collage,
        this.specialization,
        this.options,
        this.isTrue});

  bookQuestionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    reference = json['reference'];
    term = json['term'];
    collage = json['collage'];
    specialization = json['specialization'];
    options =
    json['options'] != null ? new Options.fromJson(json['options']) : null;
    isTrue = json['is_true'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['reference'] = this.reference;
    data['term'] = this.term;
    data['collage'] = this.collage;
    data['specialization'] = this.specialization;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    data['is_true'] = this.isTrue;
    return data;
  }
}

class Options {
  String? a;
  String? b;
  String? c;
  String? d;

  Options({this.a, this.b, this.c, this.d});

  Options.fromJson(Map<String, dynamic> json) {
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    return data;
  }
}