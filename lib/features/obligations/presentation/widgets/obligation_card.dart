
import 'package:material_ui/material_ui.dart';
import 'obligation_status.dart';

class ObligationCard extends StatelessWidget {
  const ObligationCard({
    super.key,
    required this.title,
    required this.companyName,
    required this.responsibleName,
    required this.status,
    required this.attachmentCount,
    required this.createdAt,
    this.onTap,
  });

  final String title;
  final String companyName;
  final String responsibleName;
  final String status;
  final int attachmentCount;
  final String createdAt;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Text('Empresa: $companyName'),
              Text('Responsável: $responsibleName'),
              ObligationStatus(status: status),
              Text('Anexos: $attachmentCount'),
              Text('Criada em: $createdAt'),
            ],
          ),
        ),
      ),
    );
  }
}
