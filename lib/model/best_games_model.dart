// To parse this JSON data, do
//
//     final bestGamesModel = bestGamesModelFromJson(jsonString);

import 'dart:convert';

BestGamesModel bestGamesModelFromJson(String str) =>
    BestGamesModel.fromJson(json.decode(str));

String bestGamesModelToJson(BestGamesModel data) => json.encode(data.toJson());

class BestGamesModel {
  List<BestGame>? bestGame;

  BestGamesModel({
    this.bestGame,
  });

  factory BestGamesModel.fromJson(Map<String, dynamic> json) => BestGamesModel(
        bestGame: json["Best Game"] == null
            ? []
            : List<BestGame>.from(
                json["Best Game"]!.map((x) => BestGame.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Best Game": bestGame == null
            ? []
            : List<dynamic>.from(bestGame!.map((x) => x.toJson())),
      };
}

class BestGame {
  String? category;
  String? description;
  List<Datum>? data;

  BestGame({
    this.category,
    this.description,
    this.data,
  });

  factory BestGame.fromJson(Map<String, dynamic> json) => BestGame(
        category: json["category"],
        description: json["Description"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "Description": description,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? name;
  String? thumbnail;
  String? link;
  String? description;
  String? rating;
  String? playercount;
  List<dynamic>? image;

  Datum({
    this.name,
    this.thumbnail,
    this.link,
    this.description,
    this.rating,
    this.playercount,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        thumbnail: json["thumbnail"],
        link: json["link"],
        description: json["Description"],
        rating: json["rating"],
        playercount: json["playercount"],
        image: json["image"] == null
            ? []
            : List<dynamic>.from(json["image"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "thumbnail": thumbnail,
        "link": link,
        "Description": description,
        "rating": rating,
        "playercount": playercount,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
      };
}

class ImageClass {
  String? image;

  ImageClass({
    this.image,
  });

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
