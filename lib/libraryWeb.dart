import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LibraryWeb extends StatefulWidget {
  @override
  _LibraryWebState createState() => _LibraryWebState();
}

class _LibraryWebState extends State<LibraryWeb> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('Library Login'),
      ),

      url: 'https://openlibrary.org/account/login',
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
}


