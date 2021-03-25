// To parse this JSON data, do
//
//     final modelDetailSurah = modelDetailSurahFromJson(jsonString);

import 'dart:convert';

ModelDetailSurah modelDetailSurahFromJson(String str) => ModelDetailSurah.fromJson(json.decode(str));

String modelDetailSurahToJson(ModelDetailSurah data) => json.encode(data.toJson());

class ModelDetailSurah {
  ModelDetailSurah({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  int code;
  String status;
  String message;
  Data data;

  factory ModelDetailSurah.fromJson(Map<String, dynamic> json) => ModelDetailSurah(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
    this.preBismillah,
    this.verses,
  });

  int number;
  int sequence;
  int numberOfVerses;
  Name name;
  Revelation revelation;
  DataTafsir tafsir;
  dynamic preBismillah;
  List<Verse> verses;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    number: json["number"],
    sequence: json["sequence"],
    numberOfVerses: json["numberOfVerses"],
    name: Name.fromJson(json["name"]),
    revelation: Revelation.fromJson(json["revelation"]),
    tafsir: DataTafsir.fromJson(json["tafsir"]),
    preBismillah: json["preBismillah"],
    verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "sequence": sequence,
    "numberOfVerses": numberOfVerses,
    "name": name.toJson(),
    "revelation": revelation.toJson(),
    "tafsir": tafsir.toJson(),
    "preBismillah": preBismillah,
    "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
  };
}

class Name {
  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String short;
  String long;
  Translation transliteration;
  Translation translation;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    short: json["short"],
    long: json["long"],
    transliteration: Translation.fromJson(json["transliteration"]),
    translation: Translation.fromJson(json["translation"]),
  );

  Map<String, dynamic> toJson() => {
    "short": short,
    "long": long,
    "transliteration": transliteration.toJson(),
    "translation": translation.toJson(),
  };
}

class Translation {
  Translation({
    this.en,
    this.id,
  });

  String en;
  String id;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    en: json["en"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "id": id,
  };
}

class Revelation {
  Revelation({
    this.arab,
    this.en,
    this.id,
  });

  String arab;
  String en;
  String id;

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
    arab: json["arab"],
    en: json["en"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "arab": arab,
    "en": en,
    "id": id,
  };
}

class DataTafsir {
  DataTafsir({
    this.id,
  });

  String id;

  factory DataTafsir.fromJson(Map<String, dynamic> json) => DataTafsir(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class Verse {
  Verse({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

  Number number;
  Meta meta;
  Text text;
  Translation translation;
  Audio audio;
  VerseTafsir tafsir;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    number: Number.fromJson(json["number"]),
    meta: Meta.fromJson(json["meta"]),
    text: Text.fromJson(json["text"]),
    translation: Translation.fromJson(json["translation"]),
    audio: Audio.fromJson(json["audio"]),
    tafsir: VerseTafsir.fromJson(json["tafsir"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number.toJson(),
    "meta": meta.toJson(),
    "text": text.toJson(),
    "translation": translation.toJson(),
    "audio": audio.toJson(),
    "tafsir": tafsir.toJson(),
  };
}

class Audio {
  Audio({
    this.primary,
    this.secondary,
  });

  String primary;
  List<String> secondary;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
    primary: json["primary"],
    secondary: List<String>.from(json["secondary"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "primary": primary,
    "secondary": List<dynamic>.from(secondary.map((x) => x)),
  };
}

class Meta {
  Meta({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  int juz;
  int page;
  int manzil;
  int ruku;
  int hizbQuarter;
  Sajda sajda;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    juz: json["juz"],
    page: json["page"],
    manzil: json["manzil"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: Sajda.fromJson(json["sajda"]),
  );

  Map<String, dynamic> toJson() => {
    "juz": juz,
    "page": page,
    "manzil": manzil,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    "sajda": sajda.toJson(),
  };
}

class Sajda {
  Sajda({
    this.recommended,
    this.obligatory,
  });

  bool recommended;
  bool obligatory;

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
    recommended: json["recommended"],
    obligatory: json["obligatory"],
  );

  Map<String, dynamic> toJson() => {
    "recommended": recommended,
    "obligatory": obligatory,
  };
}

class Number {
  Number({
    this.inQuran,
    this.inSurah,
  });

  int inQuran;
  int inSurah;

  factory Number.fromJson(Map<String, dynamic> json) => Number(
    inQuran: json["inQuran"],
    inSurah: json["inSurah"],
  );

  Map<String, dynamic> toJson() => {
    "inQuran": inQuran,
    "inSurah": inSurah,
  };
}

class VerseTafsir {
  VerseTafsir({
    this.id,
  });

  Id id;

  factory VerseTafsir.fromJson(Map<String, dynamic> json) => VerseTafsir(
    id: Id.fromJson(json["id"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id.toJson(),
  };
}

class Id {
  Id({
    this.short,
    this.long,
  });

  String short;
  String long;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    short: json["short"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "short": short,
    "long": long,
  };
}

class Text {
  Text({
    this.arab,
    this.transliteration,
  });

  String arab;
  Transliteration transliteration;

  factory Text.fromJson(Map<String, dynamic> json) => Text(
    arab: json["arab"],
    transliteration: Transliteration.fromJson(json["transliteration"]),
  );

  Map<String, dynamic> toJson() => {
    "arab": arab,
    "transliteration": transliteration.toJson(),
  };
}

class Transliteration {
  Transliteration({
    this.en,
  });

  String en;

  factory Transliteration.fromJson(Map<String, dynamic> json) => Transliteration(
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
  };
}
