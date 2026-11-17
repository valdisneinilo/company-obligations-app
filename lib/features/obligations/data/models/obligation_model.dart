import '../../domain/entities/obligation.dart';

class ObligationModel extends Obligation {
  const ObligationModel({
    required super.id,
    required super.title,
    required super.companyName,
    required super.responsibleName,
    required super.status,
    required super.attachmentCount,
    required super.createdAt,
  });

  factory ObligationModel.fromJson(Map<String, dynamic> json) {
    return ObligationModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      companyName: json['companyName'] as String,
      responsibleName: json['responsibleName'] as String,
      status: json['status'] as String,
      attachmentCount: json['attachmentCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}