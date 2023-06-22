import 'package:e_bookly/features/home/data/models/book_models/book_models.dart';

import 'package:e_bookly/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/utils/API_service.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  late final ApiService apiService;
  @override
  Future<Either<Failure, List<BookModels>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:programming');

      List<BookModels> books = [];
      for (var item in data['items']) {
        books.add(BookModels.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModels>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
