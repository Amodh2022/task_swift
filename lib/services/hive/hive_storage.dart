import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';

class MyCusHive {
  late Uint8List encKey;

  MyCusHive() {
    initHive();
  }

  initHive() async {
    await Hive.initFlutter();
    var keyBox = await Hive.openBox('task-swift');
    if (!keyBox.containsKey('key')) {
      var key = Hive.generateSecureKey();
      keyBox.put('key', key);
    }
    var key = keyBox.get('key') as Uint8List;
    encKey = key;
    return encKey;
  }
}
