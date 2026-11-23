import 'package:go_router/go_router.dart';
import 'package:frudence/features/home/presentation/home_page.dart';
import 'package:frudence/app/shell/main_shell.dart';
import 'package:frudence/features/budget/presentation/pages/buget_page.dart';
import 'package:frudence/features/more/presentation/pages/more_page.dart';
import 'package:frudence/features/transaction/presentation/pages/transaction_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) {
                  return const HomePage();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                builder: (context, state) {
                  return const TransactionPage();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/budgets',
                builder: (context, state) {
                  return const BudgetPage();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                builder: (context, state) {
                  return const MorePage();
                },
              ),
            ],
          ),
        ],
      )
    ]
  );
}





