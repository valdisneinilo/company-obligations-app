import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'app_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const Center(
              child: Text('Dashboard'),
            );
          },
        ),
        GoRoute(
          path: '/obligations',
          builder: (context, state) {
            return const Center(child: Text('Obrigações'));
          },
        ),
        GoRoute(
          path: '/companies',
          builder: (context, state) {
            return const Center(child: Text('Empresas'));
          },
        ),
        GoRoute(
          path: '/users',
          builder: (context, state) {
            return const Center(child: Text('Usuários'));
          },
        ),
      ],
    ),
  ],
);