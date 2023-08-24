class EngineerCollagesModel {
  String? id;
  String? collageName;
  String? image;

  EngineerCollagesModel({this.id, this.collageName, this.image});

  EngineerCollagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collageName = json['collage_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['collage_name'] = this.collageName;
    data['image'] = this.image;
    return data;
  }
}