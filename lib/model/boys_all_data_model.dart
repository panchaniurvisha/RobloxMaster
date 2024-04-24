import 'dart:convert';

BoysModel boysModelFromJson(String str) => BoysModel.fromJson(json.decode(str));

String boysModelToJson(BoysModel data) => json.encode(data.toJson());

class BoysModel {
  List<Boy>? boys;

  BoysModel({
    this.boys,
  });

  factory BoysModel.fromJson(Map<String, dynamic> json) => BoysModel(
        boys: json["Boys"] == null
            ? []
            : List<Boy>.from(json["Boys"]!.map((x) => Boy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Boys": boys == null
            ? []
            : List<dynamic>.from(boys!.map((x) => x.toJson())),
      };
}

class Boy {
  String? name;
  String? price;
  String? type;
  String? description;
  String? image;
  String? link;
  List<Asset>? asset;

  Boy({
    this.name,
    this.price,
    this.type,
    this.description,
    this.image,
    this.link,
    this.asset,
  });

  factory Boy.fromJson(Map<String, dynamic> json) => Boy(
        name: json["Name"],
        price: json["Price"],
        type: json["Type"],
        description: json["Description"],
        image: json["Image"],
        link: json["link"],
        asset: json["asset"] == null
            ? []
            : List<Asset>.from(json["asset"]!.map((x) => Asset.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "Type": type,
        "Description": description,
        "Image": image,
        "link": link,
        "asset": asset == null
            ? []
            : List<dynamic>.from(asset!.map((x) => x.toJson())),
      };
}

class Asset {
  int? number;
  String? name;
  String? genres;
  String? type;
  String? description;
  String? image;

  Asset({
    this.number,
    this.name,
    this.genres,
    this.type,
    this.description,
    this.image,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        number: json["number"],
        name: json["Name"],
        genres: json["Genres"],
        type: json["Type"],
        description: json["Description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "Name": name,
        "Genres": genres,
        "Type": type,
        "Description": description,
        "image": image,
      };
}

BoysClassicPants boysClassicPantsFromJson(String str) =>
    BoysClassicPants.fromJson(json.decode(str));

String boysClassicPantsToJson(BoysClassicPants data) =>
    json.encode(data.toJson());

class BoysClassicPants {
  List<BoysClassicPant>? boysClassicPants;

  BoysClassicPants({
    this.boysClassicPants,
  });

  factory BoysClassicPants.fromJson(Map<String, dynamic> json) =>
      BoysClassicPants(
        boysClassicPants: json["Boys Classic Pants"] == null
            ? []
            : List<BoysClassicPant>.from(json["Boys Classic Pants"]!
                .map((x) => BoysClassicPant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Boys Classic Pants": boysClassicPants == null
            ? []
            : List<dynamic>.from(boysClassicPants!.map((x) => x.toJson())),
      };
}

class BoysClassicPant {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? description;
  String? image;
  String? link;

  BoysClassicPant({
    this.name,
    this.price,
    this.type,
    this.genres,
    this.description,
    this.image,
    this.link,
  });

  factory BoysClassicPant.fromJson(Map<String, dynamic> json) =>
      BoysClassicPant(
        name: json["Name"],
        price: json["Price"],
        type: json["Type"],
        genres: json["Genres"],
        description: json["Description"],
        image: json["Image"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "Type": type,
        "Genres": genres,
        "Description": description,
        "Image": image,
        "Link": link,
      };
}

// To parse this JSON data, do
//
//     final boysClassicShirts = boysClassicShirtsFromJson(jsonString);

BoysClassicShirts boysClassicShirtsFromJson(String str) =>
    BoysClassicShirts.fromJson(json.decode(str));

String boysClassicShirtsToJson(BoysClassicShirts data) =>
    json.encode(data.toJson());

class BoysClassicShirts {
  List<BoysClassicShirt>? boysClassicShirts;

  BoysClassicShirts({
    this.boysClassicShirts,
  });

  factory BoysClassicShirts.fromJson(Map<String, dynamic> json) =>
      BoysClassicShirts(
        boysClassicShirts: json["Boys Classic Shirts"] == null
            ? []
            : List<BoysClassicShirt>.from(json["Boys Classic Shirts"]!
                .map((x) => BoysClassicShirt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Boys Classic Shirts": boysClassicShirts == null
            ? []
            : List<dynamic>.from(boysClassicShirts!.map((x) => x.toJson())),
      };
}

class BoysClassicShirt {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? description;
  String? image;
  String? link;

  BoysClassicShirt({
    this.name,
    this.price,
    this.type,
    this.genres,
    this.description,
    this.image,
    this.link,
  });

  factory BoysClassicShirt.fromJson(Map<String, dynamic> json) =>
      BoysClassicShirt(
        name: json["Name"],
        price: json["Price"],
        type: json["Type"],
        genres: json["Genres"],
        description: json["Description"],
        image: json["Image"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "Type": type,
        "Genres": genres,
        "Description": description,
        "Image": image,
        "Link": link,
      };
}

BoysSweaterModel boysSweaterModelFromJson(String str) =>
    BoysSweaterModel.fromJson(json.decode(str));

String boysSweaterModelToJson(BoysSweaterModel data) =>
    json.encode(data.toJson());

class BoysSweaterModel {
  List<BoysSweater>? boysSweaters;

  BoysSweaterModel({
    this.boysSweaters,
  });

  factory BoysSweaterModel.fromJson(Map<String, dynamic> json) =>
      BoysSweaterModel(
        boysSweaters: json["Boys Sweaters"] == null
            ? []
            : List<BoysSweater>.from(
                json["Boys Sweaters"]!.map((x) => BoysSweater.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Boys Sweaters": boysSweaters == null
            ? []
            : List<dynamic>.from(boysSweaters!.map((x) => x.toJson())),
      };
}

class BoysSweater {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? updated;
  String? description;
  String? image;
  String? link;

  BoysSweater({
    this.name,
    this.price,
    this.type,
    this.genres,
    this.updated,
    this.description,
    this.image,
    this.link,
  });

  factory BoysSweater.fromJson(Map<String, dynamic> json) => BoysSweater(
        name: json["Name"],
        price: json["Price"],
        type: json["Type"],
        genres: json["Genres"],
        updated: json["Updated"],
        description: json["Description"],
        image: json["Image"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "Type": type,
        "Genres": genres,
        "Updated": updated,
        "Description": description,
        "Image": image,
        "Link": link,
      };
}

BoysTShirtModel boysTShirtModelFromJson(String str) =>
    BoysTShirtModel.fromJson(json.decode(str));

String boysTShirtModelToJson(BoysTShirtModel data) =>
    json.encode(data.toJson());

class BoysTShirtModel {
  List<BoysTShirt>? boysTShirt;

  BoysTShirtModel({
    this.boysTShirt,
  });

  factory BoysTShirtModel.fromJson(Map<String, dynamic> json) =>
      BoysTShirtModel(
        boysTShirt: json["Boys T-Shirt"] == null
            ? []
            : List<BoysTShirt>.from(
                json["Boys T-Shirt"]!.map((x) => BoysTShirt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Boys T-Shirt": boysTShirt == null
            ? []
            : List<dynamic>.from(boysTShirt!.map((x) => x.toJson())),
      };
}

class BoysTShirt {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? description;
  String? image;
  String? link;

  BoysTShirt({
    this.name,
    this.price,
    this.type,
    this.genres,
    this.description,
    this.image,
    this.link,
  });

  factory BoysTShirt.fromJson(Map<String, dynamic> json) => BoysTShirt(
        name: json["Name"],
        price: json["Price"],
        type: json["Type"],
        genres: json["Genres"],
        description: json["Description"],
        image: json["Image"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "Type": type,
        "Genres": genres,
        "Description": description,
        "Image": image,
        "Link": link,
      };
}
