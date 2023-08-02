import 'package:flutter/services.dart';

class AppFonts{
  Future<void> loadCustomFont() async {
    final fontLoader = FontLoader('OriginalSurfer');
    await fontLoader.load();
  }
}