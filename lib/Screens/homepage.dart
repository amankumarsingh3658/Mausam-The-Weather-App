import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:mausam/Api/Apidata.dart';
import 'package:mausam/Model/WeatherDataModel.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Weatherdatamodel weatherdatamodel = Weatherdatamodel();
  final searchcontroller = TextEditingController();

  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var height = mq.height;
    var width = mq.width;
    var cityname = [
      'Mumbai',
      'Ghaziabad',
      'Chennai',
      'Hyderabad',
      'Indore',
      'Bhopal',
      'Meerut',
      'Gurugram'
    ];
    final _random = Random();
    String defcity = "Delhi";
    var city = cityname[_random.nextInt(cityname.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 35, 105, 185),
            Color.fromARGB(255, 149, 199, 239)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
      ),
      body: FutureBuilder(
        future: searchcontroller.text.isNotEmpty
            ? getData(searchcontroller.text.toString())
            : getData(defcity),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading"),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color.fromARGB(255, 35, 105, 185),
                    Color.fromARGB(255, 149, 199, 239)
                  ])),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.025,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: searchcontroller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.black12,
                          filled: true,
                          prefixIconColor: Colors.blueAccent,
                          hintText: "Search $city",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 10, color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: height * 0.15,
                        width: width * 0.92,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                maxRadius: height * 0.06,
                                backgroundImage: NetworkImage(
                                    "https://openweathermap.org/img/wn/" +
                                        snapshot.data!.weather![0].icon
                                            .toString() +
                                        "@2x.png")),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.weather![0].description
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "In ${snapshot.data!.name.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: height * 0.3,
                        width: width * 0.92,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.5)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BoxedIcon(
                                WeatherIcons.thermometer,
                                size: height * 0.06,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${snapshot.data!.main!.temp.toString().substring(0, 2)}" +
                                        "°",
                                    style: TextStyle(fontSize: height * 0.07),
                                  ),
                                  Text(
                                    "C",
                                    style: TextStyle(fontSize: height * 0.055),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: height * 0.3,
                              // width: width * 0.44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(0.5)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BoxedIcon(WeatherIcons.day_cloudy),
                                    Text(
                                      snapshot.data!.wind!.speed.toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Km/Hr",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          Expanded(
                            child: Container(
                              height: height * 0.3,
                              // width: width * 0.44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(0.5)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BoxedIcon(WeatherIcons.humidity),
                                    Text(
                                      snapshot.data!.main!.humidity.toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Percent",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Made by Aman"),
                            Text("Data Provided by OpenWeathers")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
