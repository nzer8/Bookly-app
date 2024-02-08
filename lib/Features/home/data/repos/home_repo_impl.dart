import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science',
      );

      List<BookModel> books = []; // data is the response from postman
      for (var item in data['items']) // items is List inside the data from postman
      {
        try {
          books.add(BookModel.fromJson(item));
        }catch (e){
          print(item);
        }
      }
      return right(books); // right from Either


    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    {
      try {
        var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming',
        );

        List<BookModel> books = []; // data is the response from postman
        for (var item in data['items']) // items is List inside the data from postman
            {
          books.add(BookModel.fromJson(item));
        }
        return right(books); // right from Either
      } catch (e) {
        if (e is DioError) {
          return left(
            ServerFailure.fromDioError(e),
          );
        }
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&Sorting=relevance&q=subject:Programming',
      );

      List<BookModel> books = []; // data is the response from postman
      for (var item in data['items']) // items is List inside the data from postman
          {
        try {
          books.add(BookModel.fromJson(item));
        }catch (e){
          print(item);
        }
      }
      return right(books); // right from Either


    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String query}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=intitle:$query',
      );

      List<BookModel> books = []; // data is the response from postman
      for (var item in data['items']) // items is List inside the data from postman
          {
        try {
          books.add(BookModel.fromJson(item));
        }catch (e){
          print(item);
        }
      }
      return right(books); // right from Either


    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
