// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../sun_shard/presentation/theming/theme_constants.dart';

extension SunShardSizedBox on SizedBox {
  SizedBox get xs => SizedBox(
        width: ThemeConstants.units.xs,
        height: ThemeConstants.units.xs,
      );

  SizedBox get s => SizedBox(
        width: ThemeConstants.units.s,
        height: ThemeConstants.units.s,
      );

  SizedBox get m => SizedBox(
        width: ThemeConstants.units.m,
        height: ThemeConstants.units.m,
      );

  SizedBox get l => SizedBox(
        width: ThemeConstants.units.l,
        height: ThemeConstants.units.l,
      );

  SizedBox get xl => SizedBox(
        width: ThemeConstants.units.xl,
        height: ThemeConstants.units.xl,
      );
}
