// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:sun_shard_frontend/card_holder.dart';
import 'package:sun_shard_frontend/sun/presentation/theming/theme_constants.dart';
import 'sun_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const SunAppBar(),
      body: Padding(
        padding: EdgeInsets.all(Constants.units.m),
        child: const SingleChildScrollView(
          child: CardHolder(),
        ),
      ),
    );
  }
}
