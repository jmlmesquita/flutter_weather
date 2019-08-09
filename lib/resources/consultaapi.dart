import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> getWeather(String key, String local_city) async {
  String url='http://api.openweathermap.org/data/2.5/weather?q=$local_city&appid=$key&units=metric';
  http.Response response = await  http.get(url);

  if(response.statusCode==200){
    return json.decode(response.body);
  }else{
    throw Exception("Ocorreu um erro");
  }
}


