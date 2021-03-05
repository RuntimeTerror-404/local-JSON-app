import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColorBrightness: Brightness.dark,
        primaryTextTheme: TextTheme(subtitle1: TextStyle(color: Colors.black))),
    home: HomePage(),
  ));
}

// ####################################################################### //
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  final topBar = AppBar(
    title: Text(
      "Fetching JSON data....",
      style: TextStyle(color: Colors.white),
    ),
    centerTitle: true,
    backgroundColor: Colors.black38,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString("load_json/person.json"),
          builder: (context, snapshot) {
            var mydata = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: mydata == null ? 0 : mydata.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.redAccent,
                        color: Colors.cyanAccent[100],
                        child: Column(
                          children: [
                            Text(
                              "Name: " + mydata[index]["name"],
                              style: TextStyle(
                                  color: Colors.blueGrey[800], fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Age: " + mydata[index]["age"]),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Passion: " + mydata[index]["passion"]),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ideal: " + mydata[index]["ideal"],
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
