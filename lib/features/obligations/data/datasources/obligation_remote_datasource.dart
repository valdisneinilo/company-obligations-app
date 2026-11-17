import 'package:dio/dio.dart';

import '../models/obligation_model.dart';

class ObligationRemoteDataSource {
  const ObligationRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<ObligationModel>> getObligations({
    required int page,
    required int size,
  }) async {
    final response = await _dio.get(
      '/obligations',
      queryParameters: {
        'page': page,
        'size': size,
      },
    );

    final content = response.data['content'] as List;

    return content
        .map(
          (item) => ObligationModel.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}