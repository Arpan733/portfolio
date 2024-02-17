import 'dart:convert';

class ExperienceModel {
  String title;
  String duration;
  String description;

  ExperienceModel({
    required this.title,
    required this.duration,
    required this.description,
  });

  factory ExperienceModel.fromRawJson(String str) =>
      ExperienceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        title: json["title"],
        duration: json["duration"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "duration": duration,
        "description": description,
      };
}
