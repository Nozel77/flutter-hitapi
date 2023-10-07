// To parse this JSON data, do
//
//     final animeResponseModels = animeResponseModelsFromJson(jsonString);


import 'dart:convert';

AnimeResponseModels animeResponseModelsFromJson(String str) => AnimeResponseModels.fromJson(json.decode(str));

String animeResponseModelsToJson(AnimeResponseModels data) => json.encode(data.toJson());

class AnimeResponseModels {
    bool success;
    String message;
    List<Datum> data;

    AnimeResponseModels({
        required this.success,
        required this.message,
        required this.data,
    });

    factory AnimeResponseModels.fromJson(Map<String, dynamic> json) => AnimeResponseModels(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String title;
    String genre;
    DateTime release;
    double rate;
    String sinopsis;
    String poster;

    Datum({
        required this.id,
        required this.title,
        required this.genre,
        required this.release,
        required this.rate,
        required this.sinopsis,
        required this.poster,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        genre: json["genre"],
        release: DateTime.parse(json["release"]),
        rate: json["rate"]?.toDouble(),
        sinopsis: json["sinopsis"],
        poster: json["poster"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "genre": genre,
        "release": "${release.year.toString().padLeft(4, '0')}-${release.month.toString().padLeft(2, '0')}-${release.day.toString().padLeft(2, '0')}",
        "rate": rate,
        "sinopsis": sinopsis,
        "poster": poster,
    };
}
