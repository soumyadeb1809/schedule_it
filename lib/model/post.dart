// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Post welcomeFromJson(String str) => Post.fromJson(json.decode(str));

String welcomeToJson(Post data) => json.encode(data.toJson());

class Post {
  String url;
  String scheduledTime;
  String caption;

  Post({
    this.url,
    this.scheduledTime,
    this.caption,
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    url: json["url"],
    scheduledTime: json["scheduled_time"],
    caption: json["caption"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "scheduled_time": scheduledTime,
    "caption": caption,
  };
}