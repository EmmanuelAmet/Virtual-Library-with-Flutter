import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:carousel_pro/carousel_pro.dart';
class offline extends StatefulWidget {
  @override
  _offlinePageState createState() => new _offlinePageState();
}

class _offlinePageState extends State<offline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('No Internet',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: "Quando",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: new EdgeInsets.all(20),
              child: new Card(
                child: new Container(
                  padding: new EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10.0),
                  child: new Row(
                    children: <Widget>[
                      Icon(
                        Icons.signal_cellular_connected_no_internet_4_bar,
                        color: Colors.red,
                      ),

                      Expanded(
                        child: new Text(
                          'You’re not connected\nAnd the web just isn’t the same without you\nLet’s get you back online\n   * Check that your mobile Data is turn on\n   * Make sure you’re not in airplane mode\n   * Check that your mobile wifi is turn on\n   * Restart your device in case you are having difficulties. ',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: "Alike"
                          ),
                        ),
                      ),
                      Icon(
                        Icons.signal_wifi_off,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
                child: Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 10.0),
                      child:  SizedBox(
                          height: 200.0,
                          width: 350.0,
                          child: Carousel(
                            images: [
                              Icon(Icons.signal_cellular_connected_no_internet_4_bar),
                              Icon(Icons.signal_wifi_off),
                              Icon(Icons.portable_wifi_off),
                            ],
                            dotSize: 4.0,
                            dotSpacing: 15.0,
                            dotColor: Colors.lightGreenAccent,
                            indicatorBgPadding: 5.0,
                            dotBgColor: Colors.redAccent.withOpacity(0.5),
                            borderRadius: true,
                          )
                      ),
                    ),
                    Text('It seams you\'re offline')
                  ],
                )
            ),

          ],
        )
    );
  }
}
