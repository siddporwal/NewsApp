import 'package:flutter/material.dart';

class Newsdetail extends StatefulWidget {
  String title, author, description, urlToImage, publishedAt, content;

  Newsdetail(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.title,
      this.urlToImage});
  @override
  _NewsdetailState createState() => _NewsdetailState();
}

class _NewsdetailState extends State<Newsdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            Image.network(
              widget.urlToImage,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(35.0),
                  elevation: 4.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            child: Text(
                              "By:${widget.author}",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 5.0),
                            child: Text(
                              widget.publishedAt.substring(0, 10),
                              style: TextStyle(fontSize: 15.0),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            child: Text(
                              widget.content,
                              style: TextStyle(fontSize: 23.0),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
