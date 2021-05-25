import 'package:flutter/material.dart';

class ArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF1DB954),
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text('Artist Information')),
      body: Center(
        child: Text('You have reached here'),
      ),
    );
  }
}
