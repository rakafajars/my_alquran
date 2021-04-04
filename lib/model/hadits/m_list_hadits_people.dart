import 'dart:convert';

ModelListHaditsPeople modelListHaditsPeopleFromJson(String str) => ModelListHaditsPeople.fromJson(json.decode(str));

String modelListHaditsPeopleToJson(ModelListHaditsPeople data) => json.encode(data.toJson());

class ModelListHaditsPeople {
  ModelListHaditsPeople({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory ModelListHaditsPeople.fromJson(Map<String, dynamic> json) => ModelListHaditsPeople(
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
    this.page,
    this.limit,
    this.lastPage,
    this.hadits,
  });

  int page;
  int limit;
  int lastPage;
  List<Hadit> hadits;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    page: json["page"],
    limit: json["limit"],
    lastPage: json["last_page"],
    hadits: List<Hadit>.from(json["hadits"].map((x) => Hadit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "last_page": lastPage,
    "hadits": List<dynamic>.from(hadits.map((x) => x.toJson())),
  };
}

class Hadit {
  Hadit({
    this.number,
    this.arab,
    this.id,
  });

  int number;
  String arab;
  String id;

  factory Hadit.fromJson(Map<String, dynamic> json) => Hadit(
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
