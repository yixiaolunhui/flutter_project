import 'package:flutter/material.dart';
import 'package:flutter_project/core/app/app.dart';

// flutter run  --flavor mp --target lib/main_mp.dart
// flutter build  apk  --no-shrink --flavor mp --target lib/main_mp.dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initApp(Env.qa);
}
