import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>> fetchNewestBooks();  //Either<if failure,if success>>
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failure,List<BookModel>>> fetchSearchBooks({required String query});
}