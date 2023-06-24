import 'package:dio/dio.dart';
import 'package:e_bookly/features/home/data/models/book_models/book_models.dart';

import 'package:e_bookly/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/utils/API_service.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModels>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');

      List<BookModels> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModels.fromJson(item));
        } catch (e) {
          books.add(BookModels.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModels>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');

      List<BookModels> books = [];
      for (var item in data['items']) {
        books.add(BookModels.fromJson(item));
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModels>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&sorting=relevance&q=subject:programming');

      List<BookModels> books = [];
      for (var item in data['items']) {
        books.add(BookModels.fromJson(item));
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
