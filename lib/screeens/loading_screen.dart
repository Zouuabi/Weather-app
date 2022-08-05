import 'package:clima/screeens/location_screen.dart';

import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

// this my apiKey

///  Widget [LoadingScreen]

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

/// State Widget of [LoadingScreen]

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();

    super.initState();
  }

  /// this function would create and object from the Location Class
  /// and it calls the [location.getCurrentLocation]
  /// then create an object of [NetworkHelper] to get then encoded JSON file
  /// with the use of [getData]Function

  void getLocationData() async {
    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getLocationWeather();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SpinKitSpinningLines(color: Colors.black),
      ),
    );
  }
}
