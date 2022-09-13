// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'sunshard/domain/entities/product.dart';
import 'sunshard/presentation/theming/theme_constants.dart';

class ProductCard extends StatefulWidget {
  static const cardWidth = 300.0;

  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late final Random random;
  late final int posOrNeg;
  var hovered = false;

  double get rotation => random.nextDouble() / 120 * posOrNeg;

  @override
  void initState() {
    random = Random();
    posOrNeg = (random.nextBool() ? 1 : -1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() {
          hovered = true;
        }),
        onExit: (_) => setState(() {
          hovered = false;
        }),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(rotation),
          child: Card(
            elevation: hovered ? 8 : 2,
            child: SizedBox(
              width: ProductCard.cardWidth,
              child: Padding(
                padding: EdgeInsets.all(Constants.units.m),
                child: Column(
                  children: [
                    Image.network(
                      'https://picsum.photos/400/400',
                    ),
                    SizedBox(height: Constants.units.m),
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
