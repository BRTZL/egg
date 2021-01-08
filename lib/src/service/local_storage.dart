import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  final storage = new FlutterSecureStorage();

  Future writeHighscore({int highscore}) async {
    try {
      await storage.write(key: 'highscore', value: highscore.toString());
    } catch (err) {
      return;
    }
  }

  Future<int> readHighscore() async {
    try {
      final highscore = await storage.read(key: 'highscore');
      return int.parse(highscore ?? '0') ?? 0;
    } catch (err) {
      return 0;
    }
  }

  Future writeCoin({int coin}) async {
    try {
      await storage.write(key: 'coin', value: coin.toString());
    } catch (err) {
      return;
    }
  }

  Future<int> readCoin() async {
    try {
      final coin = await storage.read(key: 'coin');
      return int.parse(coin ?? '0') ?? 0;
    } catch (err) {
      return 0;
    }
  }

  Future writeOwnedSkins({int skinIndex}) async {
    try {
      // final ownedSkins = await storage.read(key: 'ownedSkins');
      // var updatedOwnedSkins = ownedSkins.split(',')
      //   ..add(skinIndex.toString())
      //   ..join(',');
      // await storage.write(key: 'coin', value: updatedOwnedSkins);
    } catch (err) {
      return;
    }
  }

  Future<int> readOwnedSkins() async {
    try {
      final coin = await storage.read(key: 'coin');
      return int.parse(coin ?? '0') ?? 0;
    } catch (err) {
      return 0;
    }
  }

  Future writeCurrentSkin({int currentSkin}) async {
    try {
      await storage.write(key: 'current-skin', value: currentSkin.toString());
    } catch (err) {
      return;
    }
  }

  Future<int> readCurrentSkin() async {
    try {
      final currentSkin = await storage.read(key: 'current-skin');
      return int.parse(currentSkin ?? '0') ?? 0;
    } catch (err) {
      return 0;
    }
  }
}
