import 'package:e_bookly/features/home/presentation/views/book_details_view.dart';
import 'package:e_bookly/features/home/presentation/views/home_view.dart';
import 'package:e_bookly/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentaion/views/splash_view.dart';

abstract class AppRoute {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => const BookDetailsView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    )
  ]);
}
