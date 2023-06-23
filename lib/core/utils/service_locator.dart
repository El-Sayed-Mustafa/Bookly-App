import 'package:dio/dio.dart';
import 'package:e_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'API_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      ApiService(
        Dio(),
      ),
    ),
  );
}
