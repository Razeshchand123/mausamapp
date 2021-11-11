import 'package:http/http.dart' as http;
import 'dart:convert';

class worker {
  late String location;
// constructor
  worker({this.location = "delhi"}) {
    location = this.location;
  }

  late var temp;
  late var humidity;
  late var airspeed;
  late var description;
  late var main;
  late var icon;

  Future<void> getdata() async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e96f1abc3f6dfbf2d002e30c7a27423e";

      http.Response response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);

// getting data from api
      temp = data['main']['temp'];
      humidity = data['main']['humidity'];
      airspeed = data['wind']['speed'];
      description = data['weather'][0]['description"'];
      main = data['weather'][0]['main'];
      icon = data['weather'][0]['icon'];
    } catch (e) {
      temp = "No_data";
      humidity = "No_data";
      airspeed = "No_data";
      description = "No_data";
      main = "No_data";
      location = "no location";
      icon = "50n";
    }
  }
}
