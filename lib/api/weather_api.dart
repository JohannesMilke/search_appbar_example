import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:search_appbar_example/api/weather_icons.dart';
import 'package:search_appbar_example/model/weather.dart';

class WeatherApi {
  static const apiKey = '189df97f5958253ef6c38a94537fa094';

  static Future<List<String>> searchCities({@required String query}) async {
    final limit = 3;
    final url =
        'https://api.openweathermap.org/geo/1.0/direct?q=$query&limit=$limit&appid=$apiKey';

    final response = await http.get(url);
    final body = json.decode(response.body);

    return body.map<String>((json) {
      final city = json['name'];
      final country = json['country'];

      return '$city, $country';
    }).toList();
  }

  /// Weather Api: https://openweathermap.org/current
  static Future<Weather> getWeather({@required String city}) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey';

    final response = await http.get(url);
    final body = json.decode(response.body);

    return _convert(body);
  }

  /// All Weather Conditions: https://openweathermap.org/weather-conditions
  static Weather _convert(json) {
    final main = json['weather'].first['main'];
    final city = json['name'];
    final int degrees = (json['main']['temp']).toInt();

    print('main: $main');

    if (main == 'Thunderstorm') {
      return Weather(
        city: city,
        degrees: degrees,
        description: 'Yikes, looks like a storm\'s brewing!',
        icon: WeatherIcons.thunderstorm,
      );
    } else if (main == 'Drizzle') {
      return Weather(
        city: city,
        degrees: degrees,
        description: 'Yikes, looks like rain.',
        icon: WeatherIcons.drizzle,
      );
    } else if (main == 'Rain') {
      return Weather(
        city: city,
        degrees: degrees,
        description: 'Looks like more rain.',
        icon: WeatherIcons.rain,
      );
    } else if (main == 'Snow') {
      return Weather(
        city: city,
        degrees: degrees,
        description: 'Wrap up, it\'s going to snow!',
        icon: WeatherIcons.snow,
      );
    } else if (main == 'Clear') {
      return Weather(
        city: city,
        degrees: degrees,
        description: 'Yay, sunshine!',
        icon: WeatherIcons.clear,
      );
    } else if (main == 'Clouds') {
      return Weather(
        city: city,
        degrees: degrees,
        description: 'Looks like scattered clouds today.',
        icon: WeatherIcons.clouds,
      );
    } else {
      return Weather(
        city: city,
        degrees: degrees,
        description: 'Oops, I couldn\'t find the weather for $city',
        icon: WeatherIcons.none,
      );
    }
  }
}
