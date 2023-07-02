import 'dart:convert';

//import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  final apiKey = '96bc4f42f4b0c861ed2e623189ccadc3';

  Future<void> getWeather() async {
    final weatherUri = Uri.parse('');
    final weatherResponse = await http.get(weatherUri);
    //var forecast = Forecast.fromJson(jsonDecode(weatherResponse.body));
    //forecastBox.put('lastForecast', forecast);
    //return forecast;
  }
}
