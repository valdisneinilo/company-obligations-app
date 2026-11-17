import '../entities/obligation.dart';
import '../repositories/obligation_repository.dart';

class GetObligationsUseCase {
  const GetObligationsUseCase(this._repository);

  final ObligationRepository _repository;

  Future<List<Obligation>> call({
    int page = 1,
    int size = 5,
  }) {
    return _repository.getObligations(
      page: page,
      size: size,
    );
  }
}