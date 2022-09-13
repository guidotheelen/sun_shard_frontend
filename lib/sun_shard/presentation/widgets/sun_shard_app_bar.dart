// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../../main.dart';

class SunShardAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const appBarHeight = 56.0;

  const SunShardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        SunApp.appName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(letterSpacing: 10),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
