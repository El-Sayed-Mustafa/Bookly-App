import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_models/book_models.dart';
import '../../../data/repos/home_repo.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.homeRepo) : super(NewsBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsBooks() async {
    emit(NewsBooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((failure) {
      emit(NewsBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewsBooksSuccess(books));
    });
  }
}
