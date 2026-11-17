import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/obligation_remote_datasource.dart';
import '../../data/repositories/obligation_repository_impl.dart';
import '../../domain/repositories/obligation_repository.dart';
import '../../domain/usecases/get_obligations_usecase.dart';
import '../../domain/entities/obligation.dart';

final apiClientProvider = Provider((ref) {
  return ApiClient.create();
});

final obligationDataSourceProvider = Provider((ref) {
  return ObligationRemoteDataSource(
    ref.watch(apiClientProvider),
  );
});

final obligationRepositoryProvider = Provider<ObligationRepository>((ref) {
  return ObligationRepositoryImpl(
    ref.watch(obligationDataSourceProvider),
  );
});

final getObligationsUseCaseProvider = Provider((ref) {
  return GetObligationsUseCase(
    ref.watch(obligationRepositoryProvider),
  );
});

final obligationsProvider = FutureProvider<List<Obligation>>((ref) {
  return ref.watch(getObligationsUseCaseProvider).call();
});
