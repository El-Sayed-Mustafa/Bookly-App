import 'package:dio/dio.dart';
import 'package:e_bookly/constants.dart';
import 'package:e_bookly/core/utils/go_routes.dart';
import 'package:e_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:e_bookly/features/home/presentation/manger/Featured_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/API_service.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/manger/news_books_cubit/news_books_cubit.dart';
import 'features/splash/presentaion/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBooksCubit(
            getIt.get<HomeRepoImp>(),
          ),
        ),
        BlocProvider(
          create: (context) => NewsBooksCubit(
            getIt.get<HomeRepoImp>(),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
