import 'dart:convert';

class ProjectModel {
  String title;
  String githubLink;
  String imageUrl;

  ProjectModel({
    required this.title,
    required this.githubLink,
    required this.imageUrl,
  });

  factory ProjectModel.fromRawJson(String str) =>
      ProjectModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json["title"],
        githubLink: json["githubLink"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "githubLink": githubLink,
        "imageUrl": imageUrl,
      };
}
