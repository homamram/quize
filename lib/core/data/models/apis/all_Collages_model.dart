class allcollegesModel {
  String? id;
  String? collageName;
  String? image;
  String? category;

  allcollegesModel({this.id, this.collageName, this.image, this.category});

  allcollegesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collageName = json['collage_name'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['collage_name'] = this.collageName;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
  }
}