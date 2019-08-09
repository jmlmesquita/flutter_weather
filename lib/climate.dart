import 'package:flutter/material.dart';
import 'package:flutter_weather/resources/citylist.dart';
import 'package:flutter_weather/resources/consultaapi.dart';
import 'package:flutter_weather/resources/resources.dart' as resources;

class Climate extends StatefulWidget {
  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  String city;

  Future _displayrouter(BuildContext context) async {
    Map display = await Navigator.of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return ChangeCity();
    }));

    if (display != null && display.containsKey('city')) {
      city = display['city'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Climate World"),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _displayrouter(context);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/chuva.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${city == null ? resources.local_city : city}",
                  style: styleTemp(),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/iconechuva.png'),
          ),
          tempUpdate(city)
        ],
      ),
    );
  }

  Widget tempUpdate(String local_city) {
    return FutureBuilder(
        future: getWeather(resources.key,
            local_city == null ? resources.local_city : local_city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map dataweather = snapshot.data;
            return Container(
              margin: EdgeInsets.fromLTRB(135, 280, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ListTile(
                    title: Text("\n\n\nTemperatura: "+
                      dataweather['main']['temp'].toString() + "C",
                      style: styleTemp(),
                    ),
                    subtitle: ListTile(
                      title: Text(
                          "Humidade ${dataweather['main']['humidity'].toString()}\n"
                          "Min: ${dataweather['main']['temp_min'].toString()}C\n"
                          "Max: ${dataweather['main']['temp_max'].toString()}C",
                          style: styleTemp()),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: Text('Falhou'),
            );
          }
        });
  }

  TextStyle styleTemp() {
    return TextStyle(
        color: Colors.red, fontStyle: FontStyle.normal, fontSize: 20);
  }
}
