// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

@immutable
class Product extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final double? price;
  final bool isFavorite;

  Product({
    String? id,
    required this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.isFavorite = false,
  }) : id = id ?? const Uuid().v4();

  @override
  List<Object?> get props => [id];

  @override
  String toString() => name;
}
