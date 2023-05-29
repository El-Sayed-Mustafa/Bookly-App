import 'package:e_bookly/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentaion/views/splash_view.dart';

abstract class AppRoute {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    )
  ]);
}
