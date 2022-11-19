import 'dart:convert';

List<Questions> questionsFromJson(String str) =>
    List<Questions>.from(json.decode(str).map((x) => Questions.fromJson(x)));

String questionsToJson(List<Questions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Questions {
  Questions({
    required this.id,
    required this.queText,
    required this.options,
  });

  int id;
  String queText;
  Map<String, bool> options;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        id: json["id"],
        queText: json["que_text"],
        options: Map.from(json["options"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "que_text": queText,
        "options":
            Map.from(options).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
