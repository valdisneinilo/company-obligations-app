import '../entities/obligation.dart';

abstract class ObligationRepository {
  Future<List<Obligation>> getObligations({
    required int page,
    required int size,
  });
}