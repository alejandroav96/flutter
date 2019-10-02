import 'package:flutter/material.dart';

class pageone extends StatelessWidget {

  final String title;
  pageone(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
        elevation: 10.0,
      ),
    );
  }
}
