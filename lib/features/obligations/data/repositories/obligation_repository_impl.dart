import '../../domain/entities/obligation.dart';
import '../../domain/repositories/obligation_repository.dart';
import '../datasources/obligation_remote_datasource.dart';

class ObligationRepositoryImpl implements ObligationRepository {
  const ObligationRepositoryImpl(this._dataSource);

  final ObligationRemoteDataSource _dataSource;

  @override
  Future<List<Obligation>> getObligations({
    required int page,
    required int size,
  }) {
    return _dataSource.getObligations(
      page: page,
      size: size,
    );
  }
}