// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'sunshard/domain/entities/product.dart';
import 'sunshard/presentation/theming/theme_constants.dart';
import 'sun_app_bar.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const SunAppBar(),
      body: Padding(
        padding: EdgeInsets.all(Constants.units.m),
        child: Center(
          child: Text(
            product.id,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
