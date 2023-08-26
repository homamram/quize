class specializationModel {
String? id;
String? specializationName;

specializationModel({this.id, this.specializationName});

specializationModel.fromJson(Map<String, dynamic> json) {
id = json['id'];
specializationName = json['specialization_name'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['specialization_name'] = this.specializationName;
  return data;
}
}