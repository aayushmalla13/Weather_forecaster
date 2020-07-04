import 'package:flutter/material.dart';
import 'package:weather_forecaster/screens/location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_forecaster/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();

    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '12';
    double myMarginasDouble;
    try {
      myMarginasDouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }
    return Scaffold(
        body: Center(
      child: SpinKitCircle(
        color: Colors.white,
        size: 100,
      ),
    ));
  }
}
