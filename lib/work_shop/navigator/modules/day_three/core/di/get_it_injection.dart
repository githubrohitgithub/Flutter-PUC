import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/core/storage/db/hive/box/cart_box.dart';
import 'package:get_it/get_it.dart';

import '../../page/repo/cart_repo.dart';
import '../storage/db/hive/app_database_hive.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //firebase manager

  // hive
  var appHiveDatabase = await AppHiveDatabase.instance.getInstance();
  locator.registerSingletonAsync<AppHiveDatabase>(
      () => AppHiveDatabase.instance.getInstance());
  locator.registerSingleton<CartModelBox>(
      CartModelBox(appHiveDatabase.adminSettingsBox));

  //register FireBaseRepository
  locator.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
}
