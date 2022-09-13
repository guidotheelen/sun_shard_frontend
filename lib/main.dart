// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'sun_shard/presentation/theming/sun_theme.dart';

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
      home: const Scaffold(
        body: Center(
          child: Text(appName),
        ),
      ),
    );
  }
}
