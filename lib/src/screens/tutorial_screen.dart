import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen({Key key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffc600),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Back to Home Page',
          style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/layout/tutorial.png"),
            fit: BoxFit.contain,
          ),
          color: Color(0xffffc600),
        ),
      ),
    );
  }
}
