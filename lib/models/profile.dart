import 'dart:convert';

class ProfileModel {
  String description;
  String email;
  String facebook;
  String firstname;
  String github;
  String instagram;
  String lastname;
  String linkedin;
  String phoneNo;
  String resume;
  String url;

  ProfileModel({
    required this.description,
    required this.email,
    required this.facebook,
    required this.firstname,
    required this.github,
    required this.instagram,
    required this.lastname,
    required this.linkedin,
    required this.phoneNo,
    required this.resume,
    required this.url,
  });

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        description: json["description"],
        email: json["email"],
        facebook: json["facebook"],
        firstname: json["firstname"],
        github: json["github"],
        instagram: json["instagram"],
        lastname: json["lastname"],
        linkedin: json["linkedin"],
        phoneNo: json["phoneNo"],
        resume: json["resume"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "email": email,
        "facebook": facebook,
        "firstname": firstname,
        "github": github,
        "instagram": instagram,
        "lastname": lastname,
        "linkedin": linkedin,
        "phoneNo": phoneNo,
        "resume": resume,
        "url": url,
      };
}
