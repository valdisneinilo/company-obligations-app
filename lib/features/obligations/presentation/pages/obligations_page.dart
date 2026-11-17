import 'package:material_ui/material_ui.dart';
import '../../../../core/widgets/page_header.dart';
import '../widgets/obligation_card.dart';

class ObligationsPage extends StatelessWidget {
  const ObligationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
            child: ListView(
              children: const [
                ObligationCard(
                  title: 'Obrigação da empresa 1',
                  companyName: 'Player Contabilidade Ltda.',
                  responsibleName: 'Valdisnei Nilo',
                  status: 'PENDING',
                  attachmentCount: 2,
                  createdAt: '17/11/2026',
                ),
                SizedBox(height: 12),
                ObligationCard(
                  title: 'Obrigação da empresa 2',
                  companyName: 'Player Contabilidade Ltda.',
                  responsibleName: 'Heitor Nilo',
                  status: 'IN_PROGRESS',
                  attachmentCount: 3,
                  createdAt: '16/11/2026',
                ),
                SizedBox(height: 12),
                ObligationCard(
                  title: 'Obrigação da empresa 3',
                  companyName: 'Player Contabilidade Ltda.',
                  responsibleName: 'Ieda Helen',
                  status: 'COMPLETED',
                  attachmentCount: 1,
                  createdAt: '15/11/2026',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}