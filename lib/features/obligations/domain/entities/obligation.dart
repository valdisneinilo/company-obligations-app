class Obligation {
  const Obligation({
    required this.id,
    required this.title,
    required this.companyName,
    required this.responsibleName,
    required this.status,
    required this.attachmentCount,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String companyName;
  final String responsibleName;
  final String status;
  final int attachmentCount;
  final DateTime createdAt;
}