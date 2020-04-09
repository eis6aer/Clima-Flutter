import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }


  void getWeatherData() async {
    WeatherModel model = WeatherModel();

    var weatherData = await model.getLocationWeather();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) {
            return LocationScreen(weatherData: weatherData,);
          }
          ),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitChasingDots(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
