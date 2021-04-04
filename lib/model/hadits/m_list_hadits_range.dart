import 'dart:convert';

ModelListHaditsRange modelListHaditsRangeFromJson(String str) =>
    ModelListHaditsRange.fromJson(json.decode(str));

String modelListHaditsRangeToJson(ModelListHaditsRange data) =>
    json.encode(data.toJson());

class ModelListHaditsRange {
  ModelListHaditsRange({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory ModelListHaditsRange.fromJson(Map<String, dynamic> json) =>
      ModelListHaditsRange(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.start,
    this.end,
    this.total,
    this.book,
    this.hadits,
  });

  int start;
  int end;
  int total;
  String book;
  List<HaditsRange> hadits;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        start: json["start"],
        end: json["end"],
        total: json["total"],
        book: json["book"],
        hadits: List<HaditsRange>.from(
            json["hadits"].map((x) => HaditsRange.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "total": total,
        "book": book,
        "hadits": List<dynamic>.from(hadits.map((x) => x.toJson())),
      };
}

class HaditsRange {
  HaditsRange({
    this.number,
    this.arab,
    this.id,
  });

  int number;
  String arab;
  String id;

  factory HaditsRange.fromJson(Map<String, dynamic> json) => HaditsRange(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
      };
}
