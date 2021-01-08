import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/layout/egg_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Spacer(),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Market',
                      style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/market-screen'),
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'How To Play',
                      style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/tutorial-screen'),
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 36.0),
                    child: Text(
                      'PLAY',
                      style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/game-screen'),
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
