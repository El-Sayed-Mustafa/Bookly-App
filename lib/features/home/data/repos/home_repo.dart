import 'package:dartz/dartz.dart';
import 'package:e_bookly/features/home/data/models/book_models/book_models.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModels>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModels>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModels>>> fetchSimilarBooks(
      {required String category});
}
