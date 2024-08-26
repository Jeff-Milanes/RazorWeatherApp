library weather;


import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:razor_erp_weather_app/features/weather/api/src/models/serializers.dart';

part 'weather.g.dart';


abstract class Weather implements Built<Weather, WeatherBuilder> {
  BuiltList<WeatherList> get list;

  @BuiltValueField(wireName: 'city')
  Location get currentLocation;

  Weather._();

  factory Weather([Function(WeatherBuilder b) updates]) = _$Weather;

  String toJson() {
    return json.encode(serializers.serializeWith(Weather.serializer, this));
  }

  static Weather? fromJson(dynamic json) {
    return serializers.deserializeWith(Weather.serializer, json);
  }

  static Serializer<Weather> get serializer => _$weatherSerializer;
}

abstract class Location implements Built<Location, LocationBuilder> {
  @BuiltValueField(wireName: 'name')
  String get locationName;  

  Location._();

  factory Location([Function(LocationBuilder b) updates]) = _$Location;

  String toJson() {
    return json.encode(serializers.serializeWith(Location.serializer, this));
  }

  static Location? fromJson(dynamic json) {
    return serializers.deserializeWith(Location.serializer, json);
  }

  static Serializer<Location> get serializer => _$locationSerializer;
}

abstract class WeatherList implements Built<WeatherList, WeatherListBuilder> {
  @BuiltValueField(wireName: 'dt')
  int get dateTime;

  @BuiltValueField(wireName: 'main')
  WeatherDetails get weatherDetails;

  @BuiltValueField(wireName: 'weather')
  BuiltList<WeatherCondition> get weatherConditions;

  int get visibility;

  @BuiltValueField(wireName: 'pop')
  double get precipitation;

  WeatherList._();

  factory WeatherList([Function(WeatherListBuilder b) updates]) = _$WeatherList;

  static Serializer<WeatherList> get serializer => _$weatherListSerializer;
}

abstract class WeatherDetails implements Built<WeatherDetails, WeatherDetailsBuilder> {
  double get temp;

  @BuiltValueField(wireName: 'feels_like')
  double get tempFeels;
 
 
  @BuiltValueField(wireName: 'temp_min')
  double get tempMin;
 
  @BuiltValueField(wireName: 'temp_max')
  double get tempMax;

  double get humidity;

  WeatherDetails._();

  factory WeatherDetails([Function(WeatherDetailsBuilder b) updates]) = _$WeatherDetails;

  static Serializer<WeatherDetails> get serializer => _$weatherDetailsSerializer;
}

abstract class WeatherCondition implements Built<WeatherCondition, WeatherConditionBuilder> {
  String get main;
  String get description;
  String get icon;

  WeatherCondition._();
  factory WeatherCondition([Function(WeatherConditionBuilder b) updates]) = _$WeatherCondition;

  static Serializer<WeatherCondition> get serializer => _$weatherConditionSerializer;
}
