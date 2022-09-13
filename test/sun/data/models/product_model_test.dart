import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sun_shard_frontend/sun_shard/data/models/product_model.dart';
import 'package:sun_shard_frontend/sun_shard/domain/entities/product.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tProductModel = ProductModel(id: '1234567890', name: 'Mighty crystal');

  test(
    'should be a subclass of Product entity',
    () async {
      expect(tProductModel, isA<Product>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid product model from JSON',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('product.json'));

        final result = ProductModel.fromJson(jsonMap);

        expect(result, tProductModel);
      },
    );

    test(
      'should return a valid product model from JSON without optional fields',
      () async {
        final Map<String, dynamic> jsonMap = {
          "id": "1",
          "name": "Test Text",
        };

        final result = ProductModel.fromJson(jsonMap);

        expect(result, tProductModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tProductModel.toJson();

        final expectedMap = {
          "id": "1234567890",
          "name": "Mighty crystal",
          "description": null,
          "imageUrl": null,
          "price": null,
        };

        expect(result, expectedMap);
      },
    );
  });
}
