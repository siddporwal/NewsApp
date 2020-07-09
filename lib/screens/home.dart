import 'dart:convert';
import './newsdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    
    super.initState();
    fetch_data_from_api();
  }

  List data;

  Future<String> fetch_data_from_api() async {
    var jsondata = await http.get(
        "paste your api key here");
    var fetchdata = jsonDecode(jsondata.body);
    setState(() {
      data = fetchdata["articles"];
    });
    return "Sucess";
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Newsdetail(
                              author: data[index]["author"],
                              title: data[index]["title"],
                              description: data[index]["description"],
                              urlToImage: data[index]["urlToImage"],
                              publishedAt: data[index]["publishedAt"],
                              content: data[index]["content"])));
                },
                child: Stack(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.0),
                            topRight: Radius.circular(35.0),
                          ),
                          child: Image.network(
                            data[index]["urlToImage"],
                            fit: BoxFit.cover,
                            height: 400.0,
                          ))),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                    child: Container(
                        height: 200.0,
                        width: 400.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(35.0),
                          elevation: 10.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 20.0),
                                child: Text(data[index]["title"],
                                    style: TextStyle(
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        )),
                  )
                ]),
              );
            },
            autoplay: true,
            itemCount: data == null ? 0 : data.length,
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ));
  }
}
