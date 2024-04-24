class GamesCodeModel {
  List<GameCodes>? gameCodes;

  GamesCodeModel({this.gameCodes});

  GamesCodeModel.fromJson(Map<String, dynamic> json) {
    if (json['Game Codes'] != null) {
      gameCodes = <GameCodes>[];
      json['Game Codes'].forEach((v) {
        gameCodes!.add(new GameCodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gameCodes != null) {
      data['Game Codes'] = this.gameCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GameCodes {
  String? category;
  String? description;
  List<Data>? data;

  GameCodes({this.category, this.description, this.data});

  GameCodes.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    description = json['Description'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['Description'] = this.description;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? thumbnail;
  String? description;
  List<Code>? code;
  List<Note>? note;

  Data({this.name, this.thumbnail, this.description, this.code, this.note});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thumbnail = json['thumbnail'];
    description = json['Description'];
    if (json['code'] != null) {
      code = <Code>[];
      json['code'].forEach((v) {
        code!.add(new Code.fromJson(v));
      });
    }
    if (json['note'] != null) {
      note = <Note>[];
      json['note'].forEach((v) {
        note!.add(new Note.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['Description'] = this.description;
    if (this.code != null) {
      data['code'] = this.code!.map((v) => v.toJson()).toList();
    }
    if (this.note != null) {
      data['note'] = this.note!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Code {
  String? code;
  String? description;

  Code({this.code, this.description});

  Code.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['Description'] = this.description;
    return data;
  }
}

class Note {
  String? title;
  String? description;
  String? image;
  String? description1;

  Note({this.title, this.description, this.image, this.description1});

  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['Description'];
    image = json['image'];
    description1 = json['Description1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['Description'] = this.description;
    data['image'] = this.image;
    data['Description1'] = this.description1;
    return data;
  }
}
