import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


List _features;

void main() async {
  _features = await getapiImage();

  runApp(new MaterialApp(
    home: api(),
  ));
}

Future<List> getapiImage() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/photos';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}

class api extends StatefulWidget {
  @override
  _apiState createState() => _apiState();
}

class _apiState extends State<api> {


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('belal'),
        centerTitle: true,
      ),
      body: Center(
        child:  new GridView.builder(
            itemCount: _features.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new GridTile(
            footer: new Text('${_features[index]['id']}',textAlign: TextAlign.center,),
            child: new Image.network('${_features[index]['url']}'),
          ),
        );
      },
    )
      ),
    );
  }
}
