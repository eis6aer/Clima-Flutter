import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import '../services/location.dart';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    GetLocation getLocationUseCase = GetLocation();
    await getLocationUseCase.invoke();
    GetDataUseCase getDataUseCase = GetDataUseCase(
        url: "$openWeatherMapUrl/weather?lat=${getLocationUseCase.latitude}&lon=${getLocationUseCase.longitude}&appid=$apiKey&units=metric"
    );

    var jsonData = await getDataUseCase.invoke();

    return jsonData;
  }

  Future<dynamic> getCityWeather(String city) async {
    GetDataUseCase getDataUseCase = GetDataUseCase(
        url: "$openWeatherMapUrl/weather?q=$city&appid=$apiKey&units=metric"
    );

    var jsonData = await getDataUseCase.invoke();

    return jsonData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
