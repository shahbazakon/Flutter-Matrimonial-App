import 'package:flutter/material.dart';
class Pictures extends StatefulWidget {
  const Pictures({Key? key}) : super(key: key);

  @override
  _PicturesState createState() => _PicturesState();
}

class _PicturesState extends State<Pictures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.purple,

        child: const Center(child: Text("Pictures")),
      ),
    );
  }
}
