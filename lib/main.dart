
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  // GetX Local Storage
  await GetStorage.init();

  // Await Splash Screen with other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  // TODO : Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Load all the Material Design / Themes / Localization / Bindings
  runApp(const App());
}
