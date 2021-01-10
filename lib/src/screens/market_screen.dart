import 'package:egg/src/service/local_storage.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  MarketScreen({Key key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  LocalStorageService localStorageService = LocalStorageService();
  RotatedBox getImage(int _degree, int _color, bool _upDown) {
    if (_upDown) {
      if (_degree == 0)
        _degree = 0;
      else if (_degree == 2)
        _degree = 1;
      else if (_degree == 3)
        _degree = 2;
      else if (_degree == 1) _degree = 3;
    }

    switch (_color) {
      case 0:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_blue.png' : 'assets/content/Up1_blue.png', width: 90, height: 90));
        break;
      case 1:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_green.png' : 'assets/content/Up1_green.png', width: 90, height: 90));
        break;
      case 2:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_pink.png' : 'assets/content/Up1_pink.png', width: 90, height: 90));
        break;
      case 3:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_red.png' : 'assets/content/Up1_red.png', width: 90, height: 90));
        break;
      case 4:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_yellow.png' : 'assets/content/Up1_yellow.png', width: 90, height: 90));
        break;
      case 5:
        return RotatedBox(
            quarterTurns: _degree, child: Image.asset(_upDown ? 'assets/content/Down1.png' : 'assets/content/Up1.png', width: 90, height: 90));
        break;
      case 6:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_dalga.png' : 'assets/content/Up1_dalga.png', width: 90, height: 90));
        break;
      case 7:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_flower.png' : 'assets/content/Up1_flower.png', width: 90, height: 90));
        break;
      case 8:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_garip.png' : 'assets/content/Up1_garip.png', width: 90, height: 90));
        break;
      case 9:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_puantiye.png' : 'assets/content/Up1_puantiye.png', width: 90, height: 90));
        break;
      case 10:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_zigzag_green.png' : 'assets/content/Up1_zigzag_green.png', width: 90, height: 90));
        break;
      case 11:
        return RotatedBox(
            quarterTurns: _degree,
            child: Image.asset(_upDown ? 'assets/content/Down1_zigzag_orange.png' : 'assets/content/Up1_zigzag_orange.png', width: 90, height: 90));
        break;

      default:
        return null;
        break;
    }
  }

  // _save() async {
  // final prefs = await SharedPreferences.getInstance();
  // prefs.setInt('skin', skin);
  // }

  int coin;
  int skin;
  List<int> ownedSkins;

  @override
  void initState() {
    super.initState();
    localStorageService.readCurrentSkin().then((value) => setState(() => skin = value));
    localStorageService.readCoin().then((value) => setState(() => coin = value));
    localStorageService.readOwnedSkins().then((value) => setState(() => ownedSkins = value));
  }

  Future changeSkin({@required int index}) async {
    if (!ownedSkins.contains(index)) {
      
    }

    await localStorageService.writeCurrentSkin(currentSkin: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
          'Market',
          style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    coin.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.toll,
                    color: Colors.black,
                  ),
                ],
              )),
        ],
      ),
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: skin == index ? Colors.grey[300] : Colors.white,
              onPressed: () async => await changeSkin(index: index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    ownedSkins.contains(index) ? Icons.lock_open : Icons.lock,
                    size: 40,
                    color: skin == index ? Color(0xffffc600) : Color(0xffffc600),
                  ),
                  SizedBox(width: 20),
                  !ownedSkins.contains(index) ? Text('LOCKED') : SizedBox.shrink(),
                  Spacer(flex: 4),
                  FittedBox(
                    child: Row(
                      children: <Widget>[
                        getImage(3, index, false),
                        getImage(1, index, true),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
