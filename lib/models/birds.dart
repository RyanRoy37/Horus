// To parse this JSON data, do
//C:\Users\jryan\Documents\osea_mobile\lib\models\birds.dart
//     final birds = birdsFromJson(jsonString);

import 'dart:convert';

Birds birdsFromJson(String str) => Birds.fromJson(json.decode(str));

String birdsToJson(Birds data) => json.encode(data.toJson());

class Birds {
  List<Bird> birdList;

  Birds({
    required this.birdList,
  });

  factory Birds.fromJson(Map<String, dynamic> json) => Birds(
        birdList:
            List<Bird>.from(json["birds"].map((x) => Bird.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "birds": List<dynamic>.from(birdList.map((x) => x.toJson())),
      };
}

class Bird {
  String commonName;
  String scientificName;
  String family;
  String order;
  Size size;
  String habitat;
  String geographicRange;
  String migratoryPattern;
  String altitudeRange;
  ColorMarkings colorMarkings;
  Beak beak;
  List<String> callTypes;
  String audioClip;
  String callTiming;
  List<String> primaryDiet;
  List<String> localSightings;
  String imageUrl;
  

  Bird({
    required this.commonName,
    required this.scientificName,
    required this.family,
    required this.order,
    required this.size,
    required this.habitat,
    required this.geographicRange,
    required this.migratoryPattern,
    required this.altitudeRange,
    required this.colorMarkings,
    required this.beak,
    required this.callTypes,
    required this.audioClip,
    required this.callTiming,
    required this.primaryDiet,
    required this.localSightings,
    required this.imageUrl,
  });

  factory Bird.fromJson(Map<String, dynamic> json) => Bird(
        commonName: json["common_name"],
        scientificName: json["scientific_name"],
        family: json["family"],
        order: json["order"],
        size: Size.fromJson(json["size"]),
        habitat: json["habitat"],
        geographicRange: json["geographic_range"],
        migratoryPattern: json["migratory_pattern"],
        altitudeRange: json["altitude_range"],
        colorMarkings: ColorMarkings.fromJson(json["color_markings"]),
        beak: Beak.fromJson(json["beak"]),
        callTypes: List<String>.from(json["call_types"]),
        audioClip: json["audio_clip"],
        callTiming: json["call_timing"],
        primaryDiet: List<String>.from(json["primary_diet"]),
        localSightings: List<String>.from(json["local_sightings"]),
        imageUrl: json["imageUrl"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "common_name": commonName,
        "scientific_name": scientificName,
        "family": family,
        "order": order,
        "size": size.toJson(),
        "habitat": habitat,
        "geographic_range": geographicRange,
        "migratory_pattern": migratoryPattern,
        "altitude_range": altitudeRange,
        "color_markings": colorMarkings.toJson(),
        "beak": beak.toJson(),
        "call_types": List<dynamic>.from(callTypes),
        "audio_clip": audioClip,
        "call_timing": callTiming,
        "primary_diet": List<dynamic>.from(primaryDiet),
        "local_sightings": List<dynamic>.from(localSightings),
        "imageUrl": imageUrl,
      };
}

class Size {
  String length;
  String wingspan;

  Size({required this.length, required this.wingspan});

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        length: json["length"],
        wingspan: json["wingspan"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "wingspan": wingspan,
      };
}

class ColorMarkings {
  String male;
  String female;

  ColorMarkings({required this.male, required this.female});

  factory ColorMarkings.fromJson(Map<String, dynamic> json) =>
      ColorMarkings(
        male: json["male"],
        female: json["female"],
      );

  Map<String, dynamic> toJson() => {
        "male": male,
        "female": female,
      };
}

class Beak {
  String shape;
  String color;

  Beak({required this.shape, required this.color});

  factory Beak.fromJson(Map<String, dynamic> json) => Beak(
        shape: json["shape"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "shape": shape,
        "color": color,
      };
}
