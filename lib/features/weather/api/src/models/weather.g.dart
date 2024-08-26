// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Weather> _$weatherSerializer = new _$WeatherSerializer();
Serializer<Location> _$locationSerializer = new _$LocationSerializer();
Serializer<WeatherList> _$weatherListSerializer = new _$WeatherListSerializer();
Serializer<WeatherDetails> _$weatherDetailsSerializer =
    new _$WeatherDetailsSerializer();
Serializer<WeatherCondition> _$weatherConditionSerializer =
    new _$WeatherConditionSerializer();

class _$WeatherSerializer implements StructuredSerializer<Weather> {
  @override
  final Iterable<Type> types = const [Weather, _$Weather];
  @override
  final String wireName = 'Weather';

  @override
  Iterable<Object?> serialize(Serializers serializers, Weather object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(WeatherList)])),
      'city',
      serializers.serialize(object.currentLocation,
          specifiedType: const FullType(Location)),
    ];

    return result;
  }

  @override
  Weather deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WeatherList)]))!
              as BuiltList<Object?>);
          break;
        case 'city':
          result.currentLocation.replace(serializers.deserialize(value,
              specifiedType: const FullType(Location))! as Location);
          break;
      }
    }

    return result.build();
  }
}

class _$LocationSerializer implements StructuredSerializer<Location> {
  @override
  final Iterable<Type> types = const [Location, _$Location];
  @override
  final String wireName = 'Location';

  @override
  Iterable<Object?> serialize(Serializers serializers, Location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.locationName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Location deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.locationName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherListSerializer implements StructuredSerializer<WeatherList> {
  @override
  final Iterable<Type> types = const [WeatherList, _$WeatherList];
  @override
  final String wireName = 'WeatherList';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'dt',
      serializers.serialize(object.dateTime,
          specifiedType: const FullType(int)),
      'main',
      serializers.serialize(object.weatherDetails,
          specifiedType: const FullType(WeatherDetails)),
      'weather',
      serializers.serialize(object.weatherConditions,
          specifiedType: const FullType(
              BuiltList, const [const FullType(WeatherCondition)])),
      'visibility',
      serializers.serialize(object.visibility,
          specifiedType: const FullType(int)),
      'pop',
      serializers.serialize(object.precipitation,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  WeatherList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dt':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'main':
          result.weatherDetails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WeatherDetails))!
              as WeatherDetails);
          break;
        case 'weather':
          result.weatherConditions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WeatherCondition)]))!
              as BuiltList<Object?>);
          break;
        case 'visibility':
          result.visibility = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'pop':
          result.precipitation = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherDetailsSerializer
    implements StructuredSerializer<WeatherDetails> {
  @override
  final Iterable<Type> types = const [WeatherDetails, _$WeatherDetails];
  @override
  final String wireName = 'WeatherDetails';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'temp',
      serializers.serialize(object.temp, specifiedType: const FullType(double)),
      'feels_like',
      serializers.serialize(object.tempFeels,
          specifiedType: const FullType(double)),
      'temp_min',
      serializers.serialize(object.tempMin,
          specifiedType: const FullType(double)),
      'temp_max',
      serializers.serialize(object.tempMax,
          specifiedType: const FullType(double)),
      'humidity',
      serializers.serialize(object.humidity,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  WeatherDetails deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temp':
          result.temp = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'feels_like':
          result.tempFeels = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'temp_min':
          result.tempMin = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'temp_max':
          result.tempMax = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'humidity':
          result.humidity = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherConditionSerializer
    implements StructuredSerializer<WeatherCondition> {
  @override
  final Iterable<Type> types = const [WeatherCondition, _$WeatherCondition];
  @override
  final String wireName = 'WeatherCondition';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherCondition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'main',
      serializers.serialize(object.main, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WeatherCondition deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherConditionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'main':
          result.main = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Weather extends Weather {
  @override
  final BuiltList<WeatherList> list;
  @override
  final Location currentLocation;

  factory _$Weather([void Function(WeatherBuilder)? updates]) =>
      (new WeatherBuilder()..update(updates))._build();

  _$Weather._({required this.list, required this.currentLocation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(list, r'Weather', 'list');
    BuiltValueNullFieldError.checkNotNull(
        currentLocation, r'Weather', 'currentLocation');
  }

  @override
  Weather rebuild(void Function(WeatherBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherBuilder toBuilder() => new WeatherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather &&
        list == other.list &&
        currentLocation == other.currentLocation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jc(_$hash, currentLocation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Weather')
          ..add('list', list)
          ..add('currentLocation', currentLocation))
        .toString();
  }
}

class WeatherBuilder implements Builder<Weather, WeatherBuilder> {
  _$Weather? _$v;

  ListBuilder<WeatherList>? _list;
  ListBuilder<WeatherList> get list =>
      _$this._list ??= new ListBuilder<WeatherList>();
  set list(ListBuilder<WeatherList>? list) => _$this._list = list;

  LocationBuilder? _currentLocation;
  LocationBuilder get currentLocation =>
      _$this._currentLocation ??= new LocationBuilder();
  set currentLocation(LocationBuilder? currentLocation) =>
      _$this._currentLocation = currentLocation;

  WeatherBuilder();

  WeatherBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _list = $v.list.toBuilder();
      _currentLocation = $v.currentLocation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Weather other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Weather;
  }

  @override
  void update(void Function(WeatherBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Weather build() => _build();

  _$Weather _build() {
    _$Weather _$result;
    try {
      _$result = _$v ??
          new _$Weather._(
              list: list.build(), currentLocation: currentLocation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        list.build();
        _$failedField = 'currentLocation';
        currentLocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Weather', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Location extends Location {
  @override
  final String locationName;

  factory _$Location([void Function(LocationBuilder)? updates]) =>
      (new LocationBuilder()..update(updates))._build();

  _$Location._({required this.locationName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        locationName, r'Location', 'locationName');
  }

  @override
  Location rebuild(void Function(LocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => new LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location && locationName == other.locationName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locationName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Location')
          ..add('locationName', locationName))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder> {
  _$Location? _$v;

  String? _locationName;
  String? get locationName => _$this._locationName;
  set locationName(String? locationName) => _$this._locationName = locationName;

  LocationBuilder();

  LocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locationName = $v.locationName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Location build() => _build();

  _$Location _build() {
    final _$result = _$v ??
        new _$Location._(
            locationName: BuiltValueNullFieldError.checkNotNull(
                locationName, r'Location', 'locationName'));
    replace(_$result);
    return _$result;
  }
}

class _$WeatherList extends WeatherList {
  @override
  final int dateTime;
  @override
  final WeatherDetails weatherDetails;
  @override
  final BuiltList<WeatherCondition> weatherConditions;
  @override
  final int visibility;
  @override
  final double precipitation;

  factory _$WeatherList([void Function(WeatherListBuilder)? updates]) =>
      (new WeatherListBuilder()..update(updates))._build();

  _$WeatherList._(
      {required this.dateTime,
      required this.weatherDetails,
      required this.weatherConditions,
      required this.visibility,
      required this.precipitation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(dateTime, r'WeatherList', 'dateTime');
    BuiltValueNullFieldError.checkNotNull(
        weatherDetails, r'WeatherList', 'weatherDetails');
    BuiltValueNullFieldError.checkNotNull(
        weatherConditions, r'WeatherList', 'weatherConditions');
    BuiltValueNullFieldError.checkNotNull(
        visibility, r'WeatherList', 'visibility');
    BuiltValueNullFieldError.checkNotNull(
        precipitation, r'WeatherList', 'precipitation');
  }

  @override
  WeatherList rebuild(void Function(WeatherListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherListBuilder toBuilder() => new WeatherListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherList &&
        dateTime == other.dateTime &&
        weatherDetails == other.weatherDetails &&
        weatherConditions == other.weatherConditions &&
        visibility == other.visibility &&
        precipitation == other.precipitation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jc(_$hash, weatherDetails.hashCode);
    _$hash = $jc(_$hash, weatherConditions.hashCode);
    _$hash = $jc(_$hash, visibility.hashCode);
    _$hash = $jc(_$hash, precipitation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherList')
          ..add('dateTime', dateTime)
          ..add('weatherDetails', weatherDetails)
          ..add('weatherConditions', weatherConditions)
          ..add('visibility', visibility)
          ..add('precipitation', precipitation))
        .toString();
  }
}

class WeatherListBuilder implements Builder<WeatherList, WeatherListBuilder> {
  _$WeatherList? _$v;

  int? _dateTime;
  int? get dateTime => _$this._dateTime;
  set dateTime(int? dateTime) => _$this._dateTime = dateTime;

  WeatherDetailsBuilder? _weatherDetails;
  WeatherDetailsBuilder get weatherDetails =>
      _$this._weatherDetails ??= new WeatherDetailsBuilder();
  set weatherDetails(WeatherDetailsBuilder? weatherDetails) =>
      _$this._weatherDetails = weatherDetails;

  ListBuilder<WeatherCondition>? _weatherConditions;
  ListBuilder<WeatherCondition> get weatherConditions =>
      _$this._weatherConditions ??= new ListBuilder<WeatherCondition>();
  set weatherConditions(ListBuilder<WeatherCondition>? weatherConditions) =>
      _$this._weatherConditions = weatherConditions;

  int? _visibility;
  int? get visibility => _$this._visibility;
  set visibility(int? visibility) => _$this._visibility = visibility;

  double? _precipitation;
  double? get precipitation => _$this._precipitation;
  set precipitation(double? precipitation) =>
      _$this._precipitation = precipitation;

  WeatherListBuilder();

  WeatherListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateTime = $v.dateTime;
      _weatherDetails = $v.weatherDetails.toBuilder();
      _weatherConditions = $v.weatherConditions.toBuilder();
      _visibility = $v.visibility;
      _precipitation = $v.precipitation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherList;
  }

  @override
  void update(void Function(WeatherListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherList build() => _build();

  _$WeatherList _build() {
    _$WeatherList _$result;
    try {
      _$result = _$v ??
          new _$WeatherList._(
              dateTime: BuiltValueNullFieldError.checkNotNull(
                  dateTime, r'WeatherList', 'dateTime'),
              weatherDetails: weatherDetails.build(),
              weatherConditions: weatherConditions.build(),
              visibility: BuiltValueNullFieldError.checkNotNull(
                  visibility, r'WeatherList', 'visibility'),
              precipitation: BuiltValueNullFieldError.checkNotNull(
                  precipitation, r'WeatherList', 'precipitation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'weatherDetails';
        weatherDetails.build();
        _$failedField = 'weatherConditions';
        weatherConditions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WeatherList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$WeatherDetails extends WeatherDetails {
  @override
  final double temp;
  @override
  final double tempFeels;
  @override
  final double tempMin;
  @override
  final double tempMax;
  @override
  final double humidity;

  factory _$WeatherDetails([void Function(WeatherDetailsBuilder)? updates]) =>
      (new WeatherDetailsBuilder()..update(updates))._build();

  _$WeatherDetails._(
      {required this.temp,
      required this.tempFeels,
      required this.tempMin,
      required this.tempMax,
      required this.humidity})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(temp, r'WeatherDetails', 'temp');
    BuiltValueNullFieldError.checkNotNull(
        tempFeels, r'WeatherDetails', 'tempFeels');
    BuiltValueNullFieldError.checkNotNull(
        tempMin, r'WeatherDetails', 'tempMin');
    BuiltValueNullFieldError.checkNotNull(
        tempMax, r'WeatherDetails', 'tempMax');
    BuiltValueNullFieldError.checkNotNull(
        humidity, r'WeatherDetails', 'humidity');
  }

  @override
  WeatherDetails rebuild(void Function(WeatherDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDetailsBuilder toBuilder() =>
      new WeatherDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherDetails &&
        temp == other.temp &&
        tempFeels == other.tempFeels &&
        tempMin == other.tempMin &&
        tempMax == other.tempMax &&
        humidity == other.humidity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, temp.hashCode);
    _$hash = $jc(_$hash, tempFeels.hashCode);
    _$hash = $jc(_$hash, tempMin.hashCode);
    _$hash = $jc(_$hash, tempMax.hashCode);
    _$hash = $jc(_$hash, humidity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherDetails')
          ..add('temp', temp)
          ..add('tempFeels', tempFeels)
          ..add('tempMin', tempMin)
          ..add('tempMax', tempMax)
          ..add('humidity', humidity))
        .toString();
  }
}

class WeatherDetailsBuilder
    implements Builder<WeatherDetails, WeatherDetailsBuilder> {
  _$WeatherDetails? _$v;

  double? _temp;
  double? get temp => _$this._temp;
  set temp(double? temp) => _$this._temp = temp;

  double? _tempFeels;
  double? get tempFeels => _$this._tempFeels;
  set tempFeels(double? tempFeels) => _$this._tempFeels = tempFeels;

  double? _tempMin;
  double? get tempMin => _$this._tempMin;
  set tempMin(double? tempMin) => _$this._tempMin = tempMin;

  double? _tempMax;
  double? get tempMax => _$this._tempMax;
  set tempMax(double? tempMax) => _$this._tempMax = tempMax;

  double? _humidity;
  double? get humidity => _$this._humidity;
  set humidity(double? humidity) => _$this._humidity = humidity;

  WeatherDetailsBuilder();

  WeatherDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temp = $v.temp;
      _tempFeels = $v.tempFeels;
      _tempMin = $v.tempMin;
      _tempMax = $v.tempMax;
      _humidity = $v.humidity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherDetails;
  }

  @override
  void update(void Function(WeatherDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherDetails build() => _build();

  _$WeatherDetails _build() {
    final _$result = _$v ??
        new _$WeatherDetails._(
            temp: BuiltValueNullFieldError.checkNotNull(
                temp, r'WeatherDetails', 'temp'),
            tempFeels: BuiltValueNullFieldError.checkNotNull(
                tempFeels, r'WeatherDetails', 'tempFeels'),
            tempMin: BuiltValueNullFieldError.checkNotNull(
                tempMin, r'WeatherDetails', 'tempMin'),
            tempMax: BuiltValueNullFieldError.checkNotNull(
                tempMax, r'WeatherDetails', 'tempMax'),
            humidity: BuiltValueNullFieldError.checkNotNull(
                humidity, r'WeatherDetails', 'humidity'));
    replace(_$result);
    return _$result;
  }
}

class _$WeatherCondition extends WeatherCondition {
  @override
  final String main;
  @override
  final String description;
  @override
  final String icon;

  factory _$WeatherCondition(
          [void Function(WeatherConditionBuilder)? updates]) =>
      (new WeatherConditionBuilder()..update(updates))._build();

  _$WeatherCondition._(
      {required this.main, required this.description, required this.icon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(main, r'WeatherCondition', 'main');
    BuiltValueNullFieldError.checkNotNull(
        description, r'WeatherCondition', 'description');
    BuiltValueNullFieldError.checkNotNull(icon, r'WeatherCondition', 'icon');
  }

  @override
  WeatherCondition rebuild(void Function(WeatherConditionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherConditionBuilder toBuilder() =>
      new WeatherConditionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherCondition &&
        main == other.main &&
        description == other.description &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, main.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherCondition')
          ..add('main', main)
          ..add('description', description)
          ..add('icon', icon))
        .toString();
  }
}

class WeatherConditionBuilder
    implements Builder<WeatherCondition, WeatherConditionBuilder> {
  _$WeatherCondition? _$v;

  String? _main;
  String? get main => _$this._main;
  set main(String? main) => _$this._main = main;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  WeatherConditionBuilder();

  WeatherConditionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _main = $v.main;
      _description = $v.description;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherCondition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherCondition;
  }

  @override
  void update(void Function(WeatherConditionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherCondition build() => _build();

  _$WeatherCondition _build() {
    final _$result = _$v ??
        new _$WeatherCondition._(
            main: BuiltValueNullFieldError.checkNotNull(
                main, r'WeatherCondition', 'main'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'WeatherCondition', 'description'),
            icon: BuiltValueNullFieldError.checkNotNull(
                icon, r'WeatherCondition', 'icon'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
