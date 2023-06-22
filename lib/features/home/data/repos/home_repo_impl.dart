import 'package:e_bookly/features/home/data/models/book_models/book_models.dart';

import 'package:e_bookly/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModels>>> fetchBestSellerBooks() {
    // TODO: implement fetchBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModels>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
