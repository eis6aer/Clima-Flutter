import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Position position;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    GetLocation getLocation = GetLocation();
    await getLocation.invoke();
    print(getLocation.longitude);
    print(getLocation.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
