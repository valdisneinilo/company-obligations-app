import 'package:go_router/go_router.dart';
import 'app_shell.dart';
import 'app_routes.dart';
import '../features/companies/presentation/pages/companies_page.dart';
import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/obligations/presentation/pages/obligations_page.dart';
import '../features/users/presentation/pages/users_page.dart';


final appRouter = GoRouter(
  initialLocation:AppRoutes.dashboard,

  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: AppRoutes.obligations,
          builder: (context, state) => const ObligationsPage(),
        ),
        GoRoute(
          path: AppRoutes.companies,
          builder: (context, state) => const CompaniesPage(),
        ),
        GoRoute(
          path: AppRoutes.users,
          builder: (context, state) => const UsersPage(),
        ),
      ],
    ),
  ],
);