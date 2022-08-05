import 'location.dart';
import 'networking.dart';

///this class handle the messages that  apppear according to the
/// value of tempreture
const String apiKey = '5181c9aad82d283aae87a2190bf50ca1';
const String weatherUrl = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  String getWeatherDiscription(int condition) {
    if (condition < 300) {
      return '☁️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🤐';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '⛅';
    } else {
      return '😵‍💫';
    }
  }

  String getWeatherMessage(int temperature) {
    if (temperature > 25) {
      return "It's IceCream Time";
    } else if (temperature > 20) {
      return 'Time for shorts Bruh';
    }
    if (temperature > 10) {
      return 'You need to cover your ass';
    } else {
      return "Bring a coat just in case";
    }
  }

  Future getLocationWeather() async {

    Location location = Location();
    
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      url:
          '${weatherUrl}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );
    return await networkHelper.getData();
  }
}
