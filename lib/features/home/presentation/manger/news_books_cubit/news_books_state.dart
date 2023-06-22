part of 'news_books_cubit.dart';

abstract class NewsBooksState extends Equatable {
  const NewsBooksState();

  @override
  List<Object> get props => [];
}

class FeatureBooksInitial extends NewsBooksState {}

class FeatureBooksLoading extends NewsBooksState {}

class FeatureBooksFailure extends NewsBooksState {
  final String errMessage;

  const FeatureBooksFailure(this.errMessage);
}

class FeatureBooksSuccess extends NewsBooksState {
  final List<BookModels> books;

  const FeatureBooksSuccess(this.books);
}
