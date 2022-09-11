// Package imports:
import 'package:equatable/equatable.dart';

/// Base class for all failures.
abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}
