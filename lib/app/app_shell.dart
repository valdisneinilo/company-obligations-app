import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    final selectedIndex = switch (currentPath) {
      '/obligations' => 1,
      '/companies' => 2,
      '/users' => 3,
      _ => 0,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Obligations'),
      ),
      drawer: NavigationDrawer(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          final routes = [
            '/',
            '/obligations',
            '/companies',
            '/users',
          ];

          context.go(routes[index]);
          Navigator.pop(context);
        },
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 24, 16, 24),
            child: Text(
              'Company Obligations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.dashboard_outlined),
            label: Text('Dashboard'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.assignment_outlined),
            label: Text('Obrigações'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.business_outlined),
            label: Text('Empresas'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.people_outline),
            label: Text('Usuários'),
          ),
        ],
      ),
      body: child,
    );
  }
}