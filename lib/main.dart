import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Detail_screen.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(FoodBuddyApp());
}

// Main App
class FoodBuddyApp extends StatefulWidget {
  @override
  _FoodBuddyAppState createState() => _FoodBuddyAppState();
}

class _FoodBuddyAppState extends State<FoodBuddyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Buddy',
      theme: ThemeData(primaryColor: Color(0xff2ECC72)),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreenBody());
  }
}

// HomeScreenBody

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final foodControler = TextEditingController();
  List data = [];

  Future getData() async {
    String query = foodControler.text;
    final url =
        "https://api.edamam.com/search?q=${query}&app_id=46260108&app_key=70799313a46016dd95b276e32cc385f9";
    http.Response response = await http.get(url);
    Map<String, dynamic> resbody = await json.decode(response.body);
    // print(resbody['hits']);
    setState(() {
      data = [];
      data = resbody['hits'];
      // print(data[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // Green Card
          Container(
            height: 260,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff2ECC72),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Food Buddy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44.0,
                        fontFamily: 'Tahoma'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 240,
                          height: 45,
                          child: TextField(
                            controller: foodControler,
                            style: TextStyle(fontFamily: 'comic'),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Chicken Curry ...',
                              contentPadding: const EdgeInsets.only(
                                  left: 24.0, bottom: 8.0, top: 8.0),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              getData();
                            },
                            // backgroundColor: Color(0xff4FA260),
                            child: Icon(Icons.search),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
          //End of green Card
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext cntx, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Details(data[index]['recipe']),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage:
                            NetworkImage(data[index]['recipe']['image']),
                      ),
                      SizedBox(
                        width: 250.0,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data[index]['recipe']['label'],
                                  style: TextStyle(
                                      fontSize: 25, fontFamily: 'comic'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
