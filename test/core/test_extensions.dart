import 'package:mocktail/mocktail.dart';

extension SunShardVerificationResult on VerificationResult {
  bool get calledOnce => callCount == 1;
}
