import 'dart:convert';

GirlsModel girlsModelFromJson(String str) =>
    GirlsModel.fromJson(json.decode(str));

String girlsModelToJson(GirlsModel data) => json.encode(data.toJson());

class GirlsModel {
  List<Girl>? girls;

  GirlsModel({
    this.girls,
  });

  factory GirlsModel.fromJson(Map<String, dynamic> json) => GirlsModel(
        girls: json["Girls"] == null
            ? []
            : List<Girl>.from(json["Girls"]!.map((x) => Girl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Girls": girls == null
            ? []
            : List<dynamic>.from(girls!.map((x) => x.toJson())),
      };
}

class Girl {
  String? name;
  String? price;
  String? type;
  String? description;
  String? image;
  String? link;
  List<Asset>? asset;

  Girl({
    this.name,
    this.price,
    this.type,
    this.description,
    this.image,
    this.link,
    this.asset,
  });

  factory Girl.fromJson(Map<String, dynamic> json) => Girl(
        name: json["Name"],
        price: json["Price"],
        type: json["Type"],
        description: json["Description"],
        image: json["Image"],
        link: json["link"],
        asset: json["Asset"] == null
            ? []
            : List<Asset>.from(json["Asset"]!.map((x) => Asset.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Price": price,
        "Type": type,
        "Description": description,
        "Image": image,
        "link": link,
        "Asset": asset == null
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

class GirlsClassicPantsModel {
  List<GirlsClassicPants>? girlsClassicPants;

  GirlsClassicPantsModel({this.girlsClassicPants});

  GirlsClassicPantsModel.fromJson(Map<String, dynamic> json) {
    if (json['Girls Classic Pants'] != null) {
      girlsClassicPants = <GirlsClassicPants>[];
      json['Girls Classic Pants'].forEach((v) {
        girlsClassicPants!.add(new GirlsClassicPants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.girlsClassicPants != null) {
      data['Girls Classic Pants'] =
          this.girlsClassicPants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GirlsClassicPants {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? description;
  String? image;
  String? link;

  GirlsClassicPants(
      {this.name,
      this.price,
      this.type,
      this.genres,
      this.description,
      this.image,
      this.link});

  GirlsClassicPants.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    price = json['Price'];
    type = json['Type'];
    genres = json['Genres'];
    description = json['Description'];
    image = json['Image'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Price'] = this.price;
    data['Type'] = this.type;
    data['Genres'] = this.genres;
    data['Description'] = this.description;
    data['Image'] = this.image;
    data['Link'] = this.link;
    return data;
  }
}

GirlsClassicShirtsModel girlsClassicShirtsModelFromJson(String str) =>
    GirlsClassicShirtsModel.fromJson(json.decode(str));

String girlsClassicShirtsModelToJson(GirlsClassicShirtsModel data) =>
    json.encode(data.toJson());

class GirlsClassicShirtsModel {
  List<GirlsClassicShirt>? girlsClassicShirts;

  GirlsClassicShirtsModel({
    this.girlsClassicShirts,
  });

  factory GirlsClassicShirtsModel.fromJson(Map<String, dynamic> json) =>
      GirlsClassicShirtsModel(
        girlsClassicShirts: json["Girls Classic Shirts"] == null
            ? []
            : List<GirlsClassicShirt>.from(json["Girls Classic Shirts"]!
                .map((x) => GirlsClassicShirt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Girls Classic Shirts": girlsClassicShirts == null
            ? []
            : List<dynamic>.from(girlsClassicShirts!.map((x) => x.toJson())),
      };
}

class GirlsClassicShirt {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? description;
  String? image;
  String? link;

  GirlsClassicShirt({
    this.name,
    this.price,
    this.type,
    this.genres,
    this.description,
    this.image,
    this.link,
  });

  factory GirlsClassicShirt.fromJson(Map<String, dynamic> json) =>
      GirlsClassicShirt(
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

GirlsTShirtsModel girlsTShirtsModelFromJson(String str) =>
    GirlsTShirtsModel.fromJson(json.decode(str));

String girlsTShirtsModelToJson(GirlsTShirtsModel data) =>
    json.encode(data.toJson());

class GirlsTShirtsModel {
  List<GirlsTShirt>? girlsTShirt;

  GirlsTShirtsModel({
    this.girlsTShirt,
  });

  factory GirlsTShirtsModel.fromJson(Map<String, dynamic> json) =>
      GirlsTShirtsModel(
        girlsTShirt: json["Girls T-Shirt"] == null
            ? []
            : List<GirlsTShirt>.from(
                json["Girls T-Shirt"]!.map((x) => GirlsTShirt.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Girls T-Shirt": girlsTShirt == null
            ? []
            : List<dynamic>.from(girlsTShirt!.map((x) => x.toJson())),
      };
}

class GirlsTShirt {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? description;
  String? image;
  String? link;

  GirlsTShirt({
    this.name,
    this.price,
    this.type,
    this.genres,
    this.description,
    this.image,
    this.link,
  });

  factory GirlsTShirt.fromJson(Map<String, dynamic> json) => GirlsTShirt(
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

GirlsSweaterModel girlsSweaterModelFromJson(String str) =>
    GirlsSweaterModel.fromJson(json.decode(str));

String girlsSweaterModelToJson(GirlsSweaterModel data) =>
    json.encode(data.toJson());

class GirlsSweaterModel {
  List<GirlsSweater>? girlsSweaters;

  GirlsSweaterModel({
    this.girlsSweaters,
  });

  factory GirlsSweaterModel.fromJson(Map<String, dynamic> json) =>
      GirlsSweaterModel(
        girlsSweaters: json["Girls Sweaters"] == null
            ? []
            : List<GirlsSweater>.from(
                json["Girls Sweaters"]!.map((x) => GirlsSweater.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Girls Sweaters": girlsSweaters == null
            ? []
            : List<dynamic>.from(girlsSweaters!.map((x) => x.toJson())),
      };
}

class GirlsSweater {
  String? name;
  String? price;
  String? type;
  String? genres;
  String? updated;
  String? description;
  String? image;
  String? link;

  GirlsSweater({
    this.name,
    this.price,
    this.type,
    this.genres,
    this.updated,
    this.description,
    this.image,
    this.link,
  });

  factory GirlsSweater.fromJson(Map<String, dynamic> json) => GirlsSweater(
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
