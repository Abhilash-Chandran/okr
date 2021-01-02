import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup(String userName) {
  // Setup SharedPreferences instance
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    Command.catchAlwaysDefault = false;
    var _prefs = await SharedPreferences.getInstance();
    if (!_prefs.containsKey(userName)) {
      await _prefs.setString(userName, '{"objectives": []}');
    }
    return _prefs;
  });

  getIt.registerSingletonWithDependencies<ObjectivesManager>(
      () => ObjectivesManager(userName),
      dependsOn: [SharedPreferences]);
}
