part of 'news_books_cubit.dart';

abstract class NewsBooksState extends Equatable {
  const NewsBooksState();

  @override
  List<Object> get props => [];
}

class NewsBooksInitial extends NewsBooksState {}

class NewsBooksLoading extends NewsBooksState {}

class NewsBooksFailure extends NewsBooksState {
  final String errMessage;

  const NewsBooksFailure(this.errMessage);
}

class NewsBooksSuccess extends NewsBooksState {
  final List<BookModels> books;

  const NewsBooksSuccess(this.books);
}
