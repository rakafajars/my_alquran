import 'dart:convert';

ModeListHadits modeListHaditsFromJson(String str) => ModeListHadits.fromJson(json.decode(str));

String modeListHaditsToJson(ModeListHadits data) => json.encode(data.toJson());

class ModeListHadits {
  ModeListHadits({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  ModeListHadits copyWith({
    bool status,
    List<Datum> data,
  }) =>
      ModeListHadits(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory ModeListHadits.fromJson(Map<String, dynamic> json) => ModeListHadits(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.available,
    this.name,
  });

  String id;
  int available;
  String name;

  Datum copyWith({
    String id,
    int available,
    String name,
  }) =>
      Datum(
        id: id ?? this.id,
        available: available ?? this.available,
        name: name ?? this.name,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    available: json["available"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "available": available,
    "name": name,
  };
}
