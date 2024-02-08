import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/repos/home_repo.dart';

part 'search_books_state.dart';

class SearchCubit extends Cubit<SearchBooksState> {
  SearchCubit(
    this.homeRepo,
  ) : super(SearchBooksInitial());

  final HomeRepo homeRepo;
  String? query;
  bool hasSearchResults = false; // Add this flag
  String? data;

  Future<void> fetchSearchBooks({required String query}) async {
    emit(SearchBooksLoading());
    final Either<Failure, List<BookModel>> result =
        await homeRepo.fetchSearchBooks(query: query);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(failure.errMessage));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
