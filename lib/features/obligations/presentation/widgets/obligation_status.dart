
import 'package:material_ui/material_ui.dart';

class ObligationStatus extends StatelessWidget {
  const ObligationStatus({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      'PENDING' => ('Pendente', Colors.orange),
      'IN_PROGRESS' => ('Em andamento', Colors.blue),
      'COMPLETED' => ('Concluída', Colors.green),
      _ => ('Desconhecido', Colors.grey),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
