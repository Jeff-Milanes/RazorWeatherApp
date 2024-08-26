import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:razor_erp_weather_app/core/dependency_injection.dart';
import 'package:razor_erp_weather_app/features/weather/bloc/models/weather_model.dart';
import 'package:razor_erp_weather_app/features/weather/weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        DependencyInjection.instance<WeatherRepository>(),
        DependencyInjection.instance<GeolocatorPlatform>(),
      ),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(const WeatherFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              switch (state.status) {
                case WeatherStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator( color: Colors.white),
                  );
                case WeatherStatus.success:
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      bool isLandscape = constraints.maxWidth > constraints.maxHeight;
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: isLandscape
                            ? buildLandscapeLayout(state)
                            : buildPortraitLayout(state),
                      );
                    },
                  );
                case WeatherStatus.failure:
                  return const Center(child: Text('An error occurs.', style: TextStyle(color: Colors.white),));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildPortraitLayout(WeatherState state) {
    final weather = state.weather.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTopSection(state.locationName, weather.date ?? ''),
        const SizedBox(height: 32),
        buildTemperatureSection(
          weather: weather.weather,
          temp: weather.temp,
          icon: weather.icon,
        ),
        const SizedBox(height: 32),
        Expanded(child: buildWeeklyForecast(state.weather)),
        const SizedBox(height: 16),
        buildDetailSectionWithContainer(
          pop: weather.precipitation,
          realFeel: weather.tempFeel,
          humidity: weather.humidity,
          visibility: weather.visibility,
        ),
      ],
    );
  }

  Widget buildLandscapeLayout(WeatherState state) {
    final weather = state.weather.first;
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopSection(state.locationName, weather.date ?? ''),
              const Spacer(),
              buildTemperatureSection(
                isLandscape: true,
                weather: weather.weather,
                temp: weather.temp,
                icon: weather.icon,
              ),
              const Spacer(),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              buildDetailSectionWithContainer(
                pop: weather.precipitation,
                realFeel: weather.tempFeel,
                humidity: weather.humidity,
                visibility: weather.visibility,
              ),
              const SizedBox(height: 10),
              Expanded(child: buildWeeklyForecast(state.weather)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopSection(String locationName, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locationName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade100,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTemperatureSection({
    bool isLandscape = false,
    String? weather,
    String? icon,
    int? temp,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: isLandscape ? 2 : 1,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://openweathermap.org/img/wn/$icon@2x.png',
                placeholder: (context, url) => const CircularProgressIndicator(color: Colors.white),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 16),
              Text(
                weather ?? '--',
                style: TextStyle(
                  fontSize: isLandscape ? 20 : 24,
                  color: Colors.grey.shade100,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          flex: 1,
          child: Text(
            '$temp°',
            style: TextStyle(
              fontSize: isLandscape ? 60 : 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget buildWeeklyForecast(List<Weather> weathers) {
    return ListView.builder(
      itemCount: weathers.length,
      itemBuilder: (context, index) {
        final weather = weathers[index];
        return ListTile(
          title: Text(
            weather.date ?? '',
            style: TextStyle(
              color: Colors.grey.shade100,
            ),
          ),
          trailing: Text(
            '${weather.tempMin}° / ${weather.tempMax}°',
            style: TextStyle(
              color: Colors.grey.shade100,
            ),
          ),
          leading: CachedNetworkImage(
            imageUrl: 'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
            placeholder: (context, url) => const CircularProgressIndicator(color: Colors.white),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
    );
  }

  Widget buildDetailSectionWithContainer({
    int? pop,
    int? realFeel,
    int? humidity,
    String? visibility,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(77, 255, 255, 255),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DetailItem(
            icon: Icons.water_drop_outlined,
            label: 'PoP',
            value: '$pop%',
          ),
          DetailItem(
            icon: Icons.thermostat_outlined,
            label: 'Real Feel',
            value: '$realFeel°',
          ),
          DetailItem(
            icon: Icons.visibility_outlined,
            label: 'Visibility',
            value: visibility ?? '',
          ),
          DetailItem(
            icon: Icons.water_damage_outlined,
            label: 'Humidity',
            value: '$humidity%',
          ),
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.white),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade100,
          ),
        ),
      ],
    );
  }
}
