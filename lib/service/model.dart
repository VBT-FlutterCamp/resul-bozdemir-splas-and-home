// To parse this JSON data, do
//
//     final inboxTitle = inboxTitleFromJson(jsonString);

import 'dart:convert';

List<InboxTitle> inboxTitleFromJson(String str) =>
    List<InboxTitle>.from(json.decode(str).map((x) => InboxTitle.fromJson(x)));

String inboxTitleToJson(List<InboxTitle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InboxTitle {
  InboxTitle({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory InboxTitle.fromJson(Map<String, dynamic> json) => InboxTitle(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
