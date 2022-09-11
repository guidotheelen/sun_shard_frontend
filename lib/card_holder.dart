// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'sun/domain/entities/product.dart';
import 'sun/presentation/theming/theme_constants.dart';
import 'product_card.dart';

class CardHolder extends StatelessWidget {
  static const crystalNames = [
    'Jasper',
    'Amethyst',
    'Topaz',
    'Aquamarine',
    'Emerald',
    'Ruby',
    'Sapphire',
    'Diamond',
    'Pearl'
  ];

  const CardHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = crystalNames
        .map((name) => Product(
              name: name,
            ))
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Wrap(
            spacing: Constants.units.m,
            runSpacing: Constants.units.m,
            children: List.generate(
              productList.length,
              (index) => ProductCard(
                product: productList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}