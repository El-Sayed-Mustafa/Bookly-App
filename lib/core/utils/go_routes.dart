import 'package:e_bookly/core/utils/service_locator.dart';
import 'package:e_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:e_bookly/features/home/presentation/views/book_details_view.dart';
import 'package:e_bookly/features/home/presentation/views/home_view.dart';
import 'package:e_bookly/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/book_models/book_models.dart';
import '../../features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
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
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
        child: BookDetailsView(
          book: state.extra as BookModels,
        ),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    )
  ]);
}
