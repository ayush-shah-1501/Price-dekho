import 'package:flutter/material.dart';

class television extends StatelessWidget {

  final String mtext;
  television(this.mtext);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(mtext),),
      body: new Center(
        child: new Text(mtext),
      ),
    );
  }
}