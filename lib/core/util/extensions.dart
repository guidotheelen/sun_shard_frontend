// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../sun_shard/presentation/theming/theme_constants.dart';

extension SunShardSizedBox on SizedBox {
  SizedBox get xs => SizedBox(
        width: Constants.units.xs,
        height: Constants.units.xs,
      );

  SizedBox get s => SizedBox(
        width: Constants.units.s,
        height: Constants.units.s,
      );

  SizedBox get m => SizedBox(
        width: Constants.units.m,
        height: Constants.units.m,
      );

  SizedBox get l => SizedBox(
        width: Constants.units.l,
        height: Constants.units.l,
      );

  SizedBox get xl => SizedBox(
        width: Constants.units.xl,
        height: Constants.units.xl,
      );
}
