import 'package:flutter/material.dart';

class WebView extends StatelessWidget {
  final String url;
  const WebView({super.key , this.url});
//WebView(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(),
      body : WebView(
        initialUrl : url,
      ),
    );
  }
}