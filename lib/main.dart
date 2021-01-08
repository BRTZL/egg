import 'package:egg/src/screens/screens.dart';
import 'package:egg/src/service/local_storage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  final LocalStorageService localStorageService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EGG',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          centerTitle: true,
        ),
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      initialRoute: '/home-screen',
      routes: <String, WidgetBuilder>{
        '/splash-screen': (BuildContext context) => new SplashScreen(),
        '/home-screen': (BuildContext context) => new HomeScreen(),
        '/game-screen': (BuildContext context) => new GameScreen(),
        '/game-over-screen': (BuildContext context) => new GameOverScreen(score: 0),
        '/tutorial-screen': (BuildContext context) => new TutorialScreen(),
        '/market-screen': (BuildContext context) => new MarketScreen(),
      },
    );
  }
}
