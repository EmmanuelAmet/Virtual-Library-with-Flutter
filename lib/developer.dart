import 'package:flutter/material.dart';

class developer extends StatefulWidget {
  @override
  _developerPageState createState() => new _developerPageState();
}

class _developerPageState extends State<developer> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('About',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: "Quando",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Text(''),

          new ListTile(
            leading: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.redAccent,
            ),
            title: new Text('About This App',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: "Quando"
              ),),
            onTap: () {
            },
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('This app is base on the information provided by Open Library API and Website. Due to Copy Right issues, books are not available for download yet they are available to read and borrow.',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontFamily: "Alike"
              ),
            ),
          ),
          Divider(),


          Divider(),
        ],
      ),
    );
  }

  void Appheader(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Hi There!'),
      content: Text('Welcome to Virtual Library App.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
