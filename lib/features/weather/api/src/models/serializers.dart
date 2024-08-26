library serializers;


import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:razor_erp_weather_app/features/weather/api/weather_api.dart';

part 'serializers.g.dart';

@SerializersFor([
    Weather,
]) 
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();