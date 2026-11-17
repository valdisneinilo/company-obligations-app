import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    final selectedIndex = switch (currentPath) {
      AppRoutes.obligations => 1,
      AppRoutes.companies => 2,
      AppRoutes.users => 3,
      _ => 0,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Obrigações'),
      ),
      drawer: NavigationDrawer(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFFFE5B3),
        onDestinationSelected: (index) {
          final routes = [
            '/',
            AppRoutes.obligations,
            AppRoutes.companies,
            AppRoutes.users,
          ];

          context.go(routes[index]);
          Navigator.pop(context);
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 16, 32),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6A10D),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.business_center_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Player\nObrigações',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: Text('Dashboard'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: Text('Obrigações'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.business_outlined),
            selectedIcon: Icon(Icons.business),
            label: Text('Empresas'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: Text('Usuários'),
          ),
        ],
      ),
      body: child,
    );
  }
}