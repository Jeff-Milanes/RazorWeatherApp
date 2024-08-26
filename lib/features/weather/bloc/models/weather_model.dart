class Weather {
  Weather({this.date, this.temp, this.tempMin, this.tempMax, this.weather, this.icon, this.tempFeel, this.visibility, this.humidity, this.precipitation});

  final String? date;
  final int? temp;
  final int? tempMin;
  final int? tempMax;
  final String? weather;
  final String? icon;
  final int? tempFeel;
  final String? visibility;
  final int? humidity;
  final int? precipitation;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: json['date'] as String,
      weather: json['weather'] as String,
      icon: json['icon'] as String,
      temp: json['temp'] as int,
      tempMin: json['tempMin'] as int,
      tempMax: json['tempMax'] as int,
      precipitation: json['precipitation'] as int,
      humidity: json['humidity'] as int,
      tempFeel: json['tempFeel'] as int,
      visibility: json['visibility'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'weather': weather,
      'icon': icon,
      'temp': temp,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'precipitation': precipitation,
      'humidity': humidity,
      'tempFeel': tempFeel,
      'visibility': visibility,
    };
  }

}