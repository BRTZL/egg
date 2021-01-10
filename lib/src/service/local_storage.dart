import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  final storage = new FlutterSecureStorage();

  Future<bool> writeHighscore({int highscore}) async {
    try {
      await storage.write(key: 'highscore', value: highscore.toString());
      return true;
    } catch (err) {
      return false;
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

  Future<bool> writeCoin({int coin}) async {
    try {
      await storage.write(key: 'coin', value: coin.toString());
      return true;
    } catch (err) {
      return false;
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

  Future<bool> writeOwnedSkins({int skinIndex}) async {
    try {
      final ownedSkins = await storage.read(key: 'owned-skins');
      var updatedOwnedSkins = ownedSkins.split(',')..add(skinIndex.toString());
      await storage.write(key: 'owned-skins', value: updatedOwnedSkins.join(','));
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<List<int>> readOwnedSkins() async {
    try {
      final ownedSkins = await storage.read(key: 'owned-skins');
      final listSkins = ownedSkins.split(',');
      return listSkins.map((e) => int.parse(e) ?? 0).toList();
    } catch (err) {
      return [];
    }
  }

  Future<bool> writeCurrentSkin({int currentSkin}) async {
    try {
      await storage.write(key: 'current-skin', value: currentSkin.toString());
      return true;
    } catch (err) {
      return false;
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
