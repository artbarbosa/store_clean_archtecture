import 'package:flutter/material.dart';

import 'src/app_widget.dart';
import 'src/core/shared/inject/inject.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.initialize();

  runApp(const AppWidget());
}
