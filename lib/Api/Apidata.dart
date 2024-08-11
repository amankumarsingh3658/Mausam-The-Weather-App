import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mausam/Model/WeatherDataModel.dart';

Future<Weatherdatamodel> getData(selectedcity) async {
  var response = await http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q="+selectedcity+"&appid=e039528ff161cad5a5ee0799018622cb"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return Weatherdatamodel.fromJson(data);
  } else
    return Weatherdatamodel.fromJson(data);
}


