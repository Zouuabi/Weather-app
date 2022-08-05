import 'package:clima/screeens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, required this.locationWeather})
      : super(key: key);

  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? temperature;
  String? description;
  String? message;
  String? cityName;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      description = "asba";
      message = "asba";
      cityName = "gar3t l3tash ";
      return;
    }
    setState(() {
      double dTemperature = weatherData['main']['temp'];
      temperature = dTemperature.toInt();
      int condition = weatherData['weather'][0]['id'];
      message = weather.getWeatherMessage(temperature!);
      description = weather.getWeatherDiscription(condition);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "images/glango.jpg",
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    icon: const Icon(
                      Icons.near_me,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                     await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CityScreen();
                      }));
                    },
                    icon: const Icon(
                      Icons.location_city_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$cityName",
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    '$temperature',
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    '$description',
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    "$message",
                    style: const TextStyle(fontSize: 50),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
