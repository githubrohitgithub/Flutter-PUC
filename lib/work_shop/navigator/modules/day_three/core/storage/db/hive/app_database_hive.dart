import 'dart:io';

import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/models/cart_model.dart';
import 'package:hive/hive.dart';

import 'box/cart_box.dart';


class AppHiveDatabase {
  static final AppHiveDatabase _instance = AppHiveDatabase._();
  static AppHiveDatabase get instance => _instance;

  Future<void>? _initialization;

  late Box<CartModel> adminSettingsBox;

  late CartModelBox cartModelBoxInstance;

  bool _isInitialized = false; // Track initialization status

  AppHiveDatabase._() {
    _initialization = _initialize();
  }

  Future<void> _initialize({String? path}) async {
    final appDocumentDir = Directory.systemTemp;
    Hive.init(path ?? appDocumentDir.path);
    Hive.registerAdapter(CartModelAdapter());


    adminSettingsBox = await Hive.openBox<CartModel>('admin_settings');

    cartModelBoxInstance = CartModelBox(adminSettingsBox);
    _isInitialized = true; // Mark initialization as complete
  }

  Future<AppHiveDatabase> getInstance() async {
    await _initialization;
    if (_isInitialized) {
      return _instance;
    } else {
      await _initialize(); // Initialize Hive and boxes
      return _instance;
    }
  }
}
