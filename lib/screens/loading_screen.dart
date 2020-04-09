import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  GetLocation getLocationUseCase = GetLocation();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await getLocationUseCase.invoke();
    getData();
  }

  void getData() async {
    GetDataUseCase getDataUseCase = GetDataUseCase(
        url: "https://api.openweathermap.org/data/2.5/weather?lat=${getLocationUseCase.latitude}&lon=${getLocationUseCase.longitude}&appid=$apiKey&units=metric"
    );

    var jsonData = await getDataUseCase.invoke();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(weatherData: jsonData,);
          }
        )
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
