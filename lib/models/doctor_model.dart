// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DoctorModel {
  String? name;
  String? hospitalName;
  String? experience;
  String? description;
  String? image;

  DoctorModel({
    this.name,
    this.hospitalName,
    this.experience,
    this.description,
    this.image,
  });

  DoctorModel copyWith({
    String? name,
    String? hospitalName,
    String? experience,
    String? description,
    String? image,
  }) =>
      DoctorModel(
        name: name ?? this.name,
        hospitalName: hospitalName ?? this.hospitalName,
        experience: experience ?? this.experience,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory DoctorModel.fromRawJson(String str) =>
      DoctorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        name: json["name"],
        hospitalName: json["hospitalName"],
        experience: json["experience"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hospitalName": hospitalName,
        "experience": experience,
        "description": description,
        "image": image,
      };
}
