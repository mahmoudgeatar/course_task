// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  String? status;
  int? totalResults;
  List<Result>? results;
  int? nextPage;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults:
            json["totalResults"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  Result({
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.fullDescription,
    this.imageUrl,
    this.sourceId,
    this.country,
    this.category,
    this.language,
  });

  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  // ignore: unnecessary_question_mark
  dynamic? videoUrl;
  String? description;
  String? content;
  DateTime? pubDate;
  String? fullDescription;
  String? imageUrl;
  String? sourceId;
  List<String>? country;
  List<String>? category;
  Language? language;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
        creator: json["creator"] == null
            ? null
            : List<String>.from(json["creator"].map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"],
        pubDate:
            json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        fullDescription:
            json["full_description"],
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        country: json["country"] == null
            ? null
            : List<String>.from(json["country"].map((x) => x)),
        category: json["category"] == null
            ? null
            : List<String>.from(json["category"].map((x) => x)),
        language: json["language"] == null
            ? null
            : languageValues.map![json["language"]],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? null : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate == null ? null : pubDate!.toIso8601String(),
        "full_description": fullDescription,
        "image_url": imageUrl,
        "source_id": sourceId,
        "country":
            country == null ? null : List<dynamic>.from(country!.map((x) => x)),
        "category": category == null
            ? null
            : List<dynamic>.from(category!.map((x) => x)),
        "language": language == null ? null : languageValues.reverse![language],
      };
}

// ignore: constant_identifier_names
enum Language { ENGLISH }

final languageValues = EnumValues({"english": Language.ENGLISH});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) =>  MapEntry(v, k));
    return reverseMap;
  }
}
