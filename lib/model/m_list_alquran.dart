class ModelListAlQuran {
  int code;
  String status;
  String message;
  List<Data> data;

  ModelListAlQuran({this.code, this.status, this.message, this.data});

  ModelListAlQuran.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int number;
  int sequence;
  int numberOfVerses;
  Name name;
  Revelation revelation;
  Tafsir tafsir;

  Data(
      {this.number,
        this.sequence,
        this.numberOfVerses,
        this.name,
        this.revelation,
        this.tafsir});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    sequence = json['sequence'];
    numberOfVerses = json['numberOfVerses'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    revelation = json['revelation'] != null
        ? new Revelation.fromJson(json['revelation'])
        : null;
    tafsir =
    json['tafsir'] != null ? new Tafsir.fromJson(json['tafsir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['sequence'] = this.sequence;
    data['numberOfVerses'] = this.numberOfVerses;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.revelation != null) {
      data['revelation'] = this.revelation.toJson();
    }
    if (this.tafsir != null) {
      data['tafsir'] = this.tafsir.toJson();
    }
    return data;
  }
}

class Name {
  String short;
  String long;
  Transliteration transliteration;
  Transliteration translation;

  Name({this.short, this.long, this.transliteration, this.translation});

  Name.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
    transliteration = json['transliteration'] != null
        ? new Transliteration.fromJson(json['transliteration'])
        : null;
    translation = json['translation'] != null
        ? new Transliteration.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short'] = this.short;
    data['long'] = this.long;
    if (this.transliteration != null) {
      data['transliteration'] = this.transliteration.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation.toJson();
    }
    return data;
  }
}

class Transliteration {
  String en;
  String id;

  Transliteration({this.en, this.id});

  Transliteration.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['id'] = this.id;
    return data;
  }
}

class Revelation {
  String arab;
  String en;
  String id;

  Revelation({this.arab, this.en, this.id});

  Revelation.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    en = json['en'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arab'] = this.arab;
    data['en'] = this.en;
    data['id'] = this.id;
    return data;
  }
}

class Tafsir {
  String id;

  Tafsir({this.id});

  Tafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
