import 'package:material_ui/material_ui.dart';
import '../../../../core/widgets/page_header.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Usuários',
            description: 'Gerencie os usuários cadastradas.',
          ),
        ],
      ),
    );
  }
}