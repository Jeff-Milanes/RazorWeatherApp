// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Location.serializer)
      ..add(Weather.serializer)
      ..add(WeatherCondition.serializer)
      ..add(WeatherDetails.serializer)
      ..add(WeatherList.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(WeatherCondition)]),
          () => new ListBuilder<WeatherCondition>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(WeatherList)]),
          () => new ListBuilder<WeatherList>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
