import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';


class SearchPlaces {
  String? placeName;
  // List<double> center;
  Geometry geometry;

  SearchPlaces({this.placeName, required this.geometry});

  static SearchPlaces fromJson(Map<String, dynamic> json) {
    return SearchPlaces(
        placeName: json['place_name'],
        // center: json['center'].cast<double>(),
        geometry: Geometry.fromJson(json['geometry']));
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}
