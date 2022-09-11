// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ss_frontend/sun/presentation/theming/sun_theme.dart';

void main() async {
  runApp(const SunApp());
}

class SunApp extends StatelessWidget {
  static const String appName = 'Sun Shard';

  const SunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: SunTheme,
    );
  }
}
