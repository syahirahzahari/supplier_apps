import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  home: new HomePage(),

));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  final String url = "http://staging.vectolabs.com/getdata";
  List data;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String>getJsonData() async{
    var response = await http.get(
      //encode the url
        Uri.encodeFull(url),
        //only accepct json response
        headers: {"Accept": "application/json"}
    );

    print(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve Json via HTTP get"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: RaisedButton(
                        child: new Text(data[index]['id']),
                        padding: const EdgeInsets.all(20.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );

                        },
                      ),
                    ),
                  ),
                ],

              ),
            ),
          );
        },
      ),

    );

  }
}


//second
class SecondRoute extends StatefulWidget {
  @override
  SecondRouteState createState() => new SecondRouteState();
}

class SecondRouteState extends State<SecondRoute>{

  final String url = "http://staging.vectolabs.com/getdata";
  List data;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String>getJsonData() async{
    var response = await http.get(
      //encode the url
        Uri.encodeFull(url),
        //only accepct json response
        headers: {"Accept": "application/json"}
    );

    print(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve Json via HTTP get"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: RaisedButton(
                        child: new Text(data[index]['brand']),
                        padding: const EdgeInsets.all(20.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondRoute()),
                          );

                        },
                      ),
                    ),
                  ),
                ],

              ),
            ),
          );
        },
      ),

    );

  }
}

