import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'ead22ca61f6bcdc0fb814e7762a2f079';
const openWeatherMapURl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> cityName(String city) async {
    Uri url1 = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=ead22ca61f6bcdc0fb814e7762a2f079&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url1);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getlocation();
    Uri url1 = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=ead22ca61f6bcdc0fb814e7762a2f079&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url1);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ  ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
