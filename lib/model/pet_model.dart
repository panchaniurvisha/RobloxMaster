class PetModel {
  List<Data>? data;

  PetModel({this.data});

  PetModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? image;
  List<Pet>? pet;

  Data({this.name, this.image, this.pet});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    image = json['image'];
    if (json['Pet'] != null) {
      pet = <Pet>[];
      json['Pet'].forEach((v) {
        pet!.add(new Pet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['image'] = this.image;
    if (this.pet != null) {
      data['Pet'] = this.pet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pet {
  String? name;
  String? details;
  String? rarity;
  String? price;
  String? image;

  Pet({this.name, this.details, this.rarity, this.price, this.image});

  Pet.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    details = json['Details'];
    rarity = json['Rarity'];
    price = json['Price'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Details'] = this.details;
    data['Rarity'] = this.rarity;
    data['Price'] = this.price;
    data['Image'] = this.image;
    return data;
  }
}