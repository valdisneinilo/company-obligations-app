
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/page_header.dart';
import '../providers/obligation_providers.dart';
import '../widgets/obligation_card.dart';

class ObligationsPage extends ConsumerWidget {
  const ObligationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obligationsAsync = ref.watch(obligationsProvider);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Obrigações',
            description: 'Gerencie as obrigações das empresas.',
          ),
          const SizedBox(height: 24),
          Expanded(
            child: obligationsAsync.when(
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 40,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Não foi possível carregar as obrigações.',
                      ),
                      const SizedBox(height: 12),
                      TextButton.icon(
                        onPressed: () {
                          ref.invalidate(obligationsProvider);
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                );
              },
              data: (obligations) {
                if (obligations.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nenhuma obrigação cadastrada.',
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: obligations.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                  itemBuilder: (context, index) {
                    final obligation = obligations[index];

                    return ObligationCard(
                      title: obligation.title,
                      companyName: obligation.companyName,
                      responsibleName: obligation.responsibleName,
                      status: obligation.status,
                      attachmentCount: obligation.attachmentCount,
                      createdAt: _formatDate(obligation.createdAt),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day/$month/$year';
  }
}
