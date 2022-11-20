import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.distinctions,
    required this.accuracy,
    required this.email,
    required this.name,
  });

  int distinctions;
  Map<String, List<int>> accuracy;
  String email;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        distinctions: json["distinctions"],
        accuracy: Map.from(json["accuracy"]).map((k, v) =>
            MapEntry<String, List<int>>(k, List<int>.from(v.map((x) => x)))),
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "distinctions": distinctions,
        "accuracy": Map.from(accuracy).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "email": email,
        "name": name,
      };
}
