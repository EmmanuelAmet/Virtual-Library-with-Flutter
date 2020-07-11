import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './developer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:connectivity/connectivity.dart';
import './connectivity.dart';
import './help.dart';
import 'package:flutter_share/flutter_share.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.black, primarySwatch: Colors.indigo),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Virtal Library',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: "Quando",
            fontWeight: FontWeight.w700,
          ),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help,),
            onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new help()));
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[

                Container(
                  height: 150,
                  decoration: new BoxDecoration(
                    //color: Colors.indigo,
                      image: new DecorationImage(
                        image: new AssetImage(
                          "images/cover2.jpg",
                        ),
                        fit: BoxFit.fill,
                      )),
                  child: SizedBox(
                      height: 200.0,
                      width: 350.0,
                  ),
                ),
              ],
            ),

            new ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.redAccent,
              ),
              title: new Text('Home',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontFamily: "Alike"
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            Divider(),
            new Text('      Communicate',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Alike"
              ),
            ),


            Divider(),
            new Text('     Policies',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Alike"
              ),
            ),

           
            new ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.redAccent,
              ),
              title: new Text('About',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontFamily: "Alike"
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new developer()));
              },
            ),
            Divider(),
            new ListTile(
              leading: Icon(
                Icons.apps,
                color: Colors.redAccent,
              ),
              title: new Text('Version\n1.0.0',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontFamily: "Alike"
                ),
              ),
              onTap: () {

              },
            ),
            Divider(),
          ],
        ),
      ),
      body: getListView(),
    );
  }

  Widget getListView() {
    var listView = ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(2),
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Card(
                      elevation: 10.0,
                      child: new Container(
                        padding: EdgeInsets.all(10.0),
                        child:  SizedBox(
                            height: 200.0,
                            width: 350.0,
                            child: Carousel(
                              images: [
                                Image.asset('images/appLogo.png'),
                                Image.asset('images/ebooks.jpg'),
                                Image.asset('images/pageCover.jpg'),
                                Image.asset('images/cover2.jpg'),
                                Image.asset('images/cover3.jpg'),
                                Image.asset('images/arts.jpg'),
                                Image.asset('images/biography.jpg'),
                                Image.asset('images/earth.jpg'),
                                Image.asset('images/economic.jpg'),
                                Image.asset('images/childrenYouth.jpg'),
                                Image.asset('images/environment.jpg'),
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
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityArts();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/artt.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Arts',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityFood();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/food.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Nutrition',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityComputing();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/technology.jpg',),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Computing',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityTourism();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: FadeInImage(
                                    image: new AssetImage('images/tour.jpg'),
                                    placeholder: AssetImage('images/appLogo.png'),
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(milliseconds: 4000),
                                    fadeOutDuration: Duration(milliseconds: 3000),
                                  )
                              ),
                              Text('Tourism',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityEconomics();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/economic.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Economics',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityMedical();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/medical.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Medical',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityAnthropology();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/anthro.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Anthropology',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityPsychology();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/psychology.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Psychology',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityMarketing();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/market.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Marketing',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivitySciences();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/scienceResearch.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('sciences',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityMathematics();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/maths.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Mathematics',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivitySocialScience();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/childrenYouth.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Social Sciences',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityPhysics();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/physics.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Physics',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityChemistry();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/chemistry.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Chemistry',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityStatistics();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/statistics.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Statistics',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityAgriculture();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/agric.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Agriculture',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityComSkills();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/comskills.jpeg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Comm. Skills',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityFinance();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/finance.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Finance',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityBiography();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/biography.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Biography',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityHistory();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/history.png'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('History',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityMeteorology();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/earth.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Meteorology',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityEngineering();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage(
                                  image: new AssetImage('images/engineering.jpg'),
                                  placeholder: AssetImage('images/appLogo.png'),
                                  fit: BoxFit.cover,
                                  fadeInDuration: Duration(milliseconds: 4000),
                                  fadeOutDuration: Duration(milliseconds: 3000),
                                )
                              ),
                              Text('Engineering',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityCalculus();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: FadeInImage(
                                    image: new AssetImage('images/calculus.png'),
                                    placeholder: AssetImage('images/appLogo.png'),
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(milliseconds: 4000),
                                    fadeOutDuration: Duration(milliseconds: 3000),
                                  )
                              ),
                              Text('Calculus',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivitySonography();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: FadeInImage(
                                    image: new AssetImage('images/sonography.jpg'),
                                    placeholder: AssetImage('images/appLogo.png'),
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(milliseconds: 4000),
                                    fadeOutDuration: Duration(milliseconds: 3000),
                                  )
                              ),
                              Text('Sonography',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityHumanAnatomy();
                        },
                        child: Container(
                          height: 150.0,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: FadeInImage(
                                    image: new AssetImage('images/anatomy.jpg'),
                                    placeholder: AssetImage('images/appLogo.png'),
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(milliseconds: 4000),
                                    fadeOutDuration: Duration(milliseconds: 3000),
                                  )
                              ),
                              Text('Human Anatomy',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ),

                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          _checkInternetConnectivityArtificialIntelligent();
                        },
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: FadeInImage(
                                    image: new AssetImage('images/ai.jpg'),
                                    placeholder: AssetImage('images/appLogo.png'),
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(milliseconds: 4000),
                                    fadeOutDuration: Duration(milliseconds: 3000),
                                  )
                              ),
                              Text('Artificial Intelligent',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                    fontFamily: "Quando"
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
    return listView;
  }

  _checkInternetConnectivityArts() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      arts(context);
    } else if (result == ConnectivityResult.wifi) {
      arts(context);
    }
  }


  _checkInternetConnectivityFood() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      food(context);
    } else if (result == ConnectivityResult.wifi) {
      food(context);
    }
  }

  _checkInternetConnectivityComputing() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      computing(context);
    } else if (result == ConnectivityResult.wifi) {
      computing(context);
    }
  }

  _checkInternetConnectivityTourism() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      tourism(context);
    } else if (result == ConnectivityResult.wifi) {
      tourism(context);
    }
  }

  _checkInternetConnectivityEconomics() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      economics(context);
    } else if (result == ConnectivityResult.wifi) {
      economics(context);
    }
  }

  _checkInternetConnectivityMedical() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      medical(context);
    } else if (result == ConnectivityResult.wifi) {
      medical(context);
    }
  }

  _checkInternetConnectivityAnthropology() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      anthropology(context);
    } else if (result == ConnectivityResult.wifi) {
      anthropology(context);
    }
  }

  _checkInternetConnectivityPsychology() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      psychology(context);
    } else if (result == ConnectivityResult.wifi) {
      psychology(context);
    }
  }

  _checkInternetConnectivityMarketing() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      marketing(context);
    } else if (result == ConnectivityResult.wifi) {
      marketing(context);
    }
  }

  _checkInternetConnectivitySciences() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      sciences(context);
    } else if (result == ConnectivityResult.wifi) {
      sciences(context);
    }
  }

  _checkInternetConnectivityMathematics() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      mathematics(context);
    } else if (result == ConnectivityResult.wifi) {
      mathematics(context);
    }
  }

  _checkInternetConnectivitySocialScience() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      socialScience(context);
    } else if (result == ConnectivityResult.wifi) {
      socialScience(context);
    }
  }

  _checkInternetConnectivityPhysics() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      physics(context);
    } else if (result == ConnectivityResult.wifi) {
      physics(context);
    }
  }

  _checkInternetConnectivityChemistry() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      chemistry(context);
    } else if (result == ConnectivityResult.wifi) {
      chemistry(context);
    }
  }

  _checkInternetConnectivityStatistics() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      statistics(context);
    } else if (result == ConnectivityResult.wifi) {
      statistics(context);
    }
  }


  _checkInternetConnectivityAgriculture() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      agriculture(context);
    } else if (result == ConnectivityResult.wifi) {
      agriculture(context);
    }
  }


  _checkInternetConnectivityComSkills() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      comSkills(context);
    } else if (result == ConnectivityResult.wifi) {
      comSkills(context);
    }
  }


  _checkInternetConnectivityFinance() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      finance(context);
    } else if (result == ConnectivityResult.wifi) {
      finance(context);
    }
  }


  _checkInternetConnectivityBiography() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      biography(context);
    } else if (result == ConnectivityResult.wifi) {
      biography(context);
    }
  }


  _checkInternetConnectivityHistory() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      history(context);
    } else if (result == ConnectivityResult.wifi) {
      history(context);
    }
  }


  _checkInternetConnectivityMeteorology() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      meteorology(context);
    } else if (result == ConnectivityResult.wifi) {
      meteorology(context);
    }
  }

  _checkInternetConnectivityEngineering() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      engineering(context);
    } else if (result == ConnectivityResult.wifi) {
      engineering(context);
    }
  }

  _checkInternetConnectivityMusic() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      music(context);
    } else if (result == ConnectivityResult.wifi) {
      music(context);
    }
  }

 

  _checkInternetConnectivityCalculus() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      calculus(context);
    } else if (result == ConnectivityResult.wifi) {
      calculus(context);
    }
  }

  _checkInternetConnectivitySonography() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      sonography(context);
    } else if (result == ConnectivityResult.wifi) {
      sonography(context);
    }
  }

  _checkInternetConnectivityHumanAnatomy() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      humanAnatony(context);
    } else if (result == ConnectivityResult.wifi) {
      humanAnatony(context);
    }
  }

  _checkInternetConnectivityArtificialIntelligent() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new offline()));
    } else if (result == ConnectivityResult.mobile) {
      artifiialIntelligent(context);
    } else if (result == ConnectivityResult.wifi) {
      artifiialIntelligent(context);
    }
  }

  void arts(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Arts',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Arts&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void food(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Nutrition',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Food+and+Nutrition&has_fulltext=true&m=edit&page=1&mode=ebooks',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void computing(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Computing',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),),
            ),

            url: 'https://openlibrary.org/search?q=Computer+Science&m=edit&mode=ebooks&ha_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void tourism(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Tourism',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Tourism&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void economics(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Economics',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Economics&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void medical(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Medical Science',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Medical+Sciences&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void anthropology(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Anthropology',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Anthropology&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
        }
  }

  void psychology(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Psychology',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Psychology&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void marketing(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Marketing',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Marketing&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void sciences(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Science',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Science&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void mathematics(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Mathematics',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Mathematics&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void socialScience(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Social Sciences',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Social+Sciences&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void physics(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Physics',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Physics&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void chemistry(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Chemistry',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Chemistry&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void statistics(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Statistics',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Statistics&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void agriculture(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Agriculture',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Agriculture&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void comSkills(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Communication Skills',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Communication+Skills&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void finance(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Finance',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Finance&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void biography(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Biography',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),),
            ),

            url: 'https://openlibrary.org/search?q=Biography&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void history(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('History',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=History&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void meteorology(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Meteorology',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Meteorology&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void engineering(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Engineering',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Engineering&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void politics(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Politics',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=politics&mode=ebooks&m=edit&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void music(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Music',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=music&mode=ebooks&m=edit&has_fulltext=true&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void calculus(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Calculus',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Calculus&mode=ebooks&m=edit&has_fulltext=true&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void sonography(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Sonography',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=sonography&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void humanAnatony(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Human Anatony',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=human+anatomy&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

  void artifiialIntelligent(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new WebviewScaffold(
            appBar: AppBar(
              title: Text('Artifiial Intelligent',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: "Quando",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            url: 'https://openlibrary.org/search?q=Artificial+Intelligent&mode=ebooks&m=edit&has_fulltext=true',
            withZoom: true,
            clearCache: false,
            clearCookies: false,
            withJavascript: true,
            hidden: true,
            initialChild: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.indigo,
              ),
            ),
          );
        }
    );
  }

