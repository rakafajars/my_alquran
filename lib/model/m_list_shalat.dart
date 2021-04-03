// To parse this JSON data, do
//
//     final modelListShalat = modelListShalatFromJson(jsonString);

import 'dart:convert';

ModelListShalat modelListShalatFromJson(String str) => ModelListShalat.fromJson(json.decode(str));

String modelListShalatToJson(ModelListShalat data) => json.encode(data.toJson());

class ModelListShalat {
  ModelListShalat({
    this.code,
    this.status,
    this.results,
  });

  int code;
  String status;
  Results results;

  factory ModelListShalat.fromJson(Map<String, dynamic> json) => ModelListShalat(
    code: json["code"],
    status: json["status"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "results": results.toJson(),
  };
}

class Results {
  Results({
    this.datetime,
    this.location,
    this.settings,
  });

  List<Datetime> datetime;
  Location location;
  Settings settings;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    datetime: List<Datetime>.from(json["datetime"].map((x) => Datetime.fromJson(x))),
    location: Location.fromJson(json["location"]),
    settings: Settings.fromJson(json["settings"]),
  );

  Map<String, dynamic> toJson() => {
    "datetime": List<dynamic>.from(datetime.map((x) => x.toJson())),
    "location": location.toJson(),
    "settings": settings.toJson(),
  };
}

class Datetime {
  Datetime({
    this.times,
    this.date,
  });

  Times times;
  Date date;

  factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
    times: Times.fromJson(json["times"]),
    date: Date.fromJson(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "times": times.toJson(),
    "date": date.toJson(),
  };
}

class Date {
  Date({
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  int timestamp;
  DateTime gregorian;
  DateTime hijri;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    timestamp: json["timestamp"],
    gregorian: DateTime.parse(json["gregorian"]),
    hijri: DateTime.parse(json["hijri"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "gregorian": "${gregorian.year.toString().padLeft(4, '0')}-${gregorian.month.toString().padLeft(2, '0')}-${gregorian.day.toString().padLeft(2, '0')}",
    "hijri": "${hijri.year.toString().padLeft(4, '0')}-${hijri.month.toString().padLeft(2, '0')}-${hijri.day.toString().padLeft(2, '0')}",
  };
}

class Times {
  Times({
    this.imsak,
    this.sunrise,
    this.fajr,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.midnight,
  });

  String imsak;
  String sunrise;
  String fajr;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String midnight;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
    imsak: json["Imsak"],
    sunrise: json["Sunrise"],
    fajr: json["Fajr"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    sunset: json["Sunset"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
    midnight: json["Midnight"],
  );

  Map<String, dynamic> toJson() => {
    "Imsak": imsak,
    "Sunrise": sunrise,
    "Fajr": fajr,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Sunset": sunset,
    "Maghrib": maghrib,
    "Isha": isha,
    "Midnight": midnight,
  };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
    this.elevation,
    this.city,
    this.country,
    this.countryCode,
    this.timezone,
    this.localOffset,
  });

  double latitude;
  double longitude;
  double elevation;
  String city;
  String country;
  String countryCode;
  String timezone;
  double localOffset;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    elevation: json["elevation"],
    city: json["city"],
    country: json["country"],
    countryCode: json["country_code"],
    timezone: json["timezone"],
    localOffset: json["local_offset"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "elevation": elevation,
    "city": city,
    "country": country,
    "country_code": countryCode,
    "timezone": timezone,
    "local_offset": localOffset,
  };
}

class Settings {
  Settings({
    this.timeformat,
    this.school,
    this.juristic,
    this.highlat,
    this.fajrAngle,
    this.ishaAngle,
  });

  String timeformat;
  String school;
  String juristic;
  String highlat;
  double fajrAngle;
  double ishaAngle;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    timeformat: json["timeformat"],
    school: json["school"],
    juristic: json["juristic"],
    highlat: json["highlat"],
    fajrAngle: json["fajr_angle"],
    ishaAngle: json["isha_angle"],
  );

  Map<String, dynamic> toJson() => {
    "timeformat": timeformat,
    "school": school,
    "juristic": juristic,
    "highlat": highlat,
    "fajr_angle": fajrAngle,
    "isha_angle": ishaAngle,
  };
}
