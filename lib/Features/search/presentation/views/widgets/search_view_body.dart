import 'package:bookly_app/Features/home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widgets.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'custom_search_text_field.dart';

  // ignore: must_be_immutable
class SearchViewBody extends StatelessWidget {
  SearchViewBody({Key? key}) : super(key: key);

  String? query;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          CustomSearchTextField(
            onChanged: (query) {
              if (query.isNotEmpty) {
                context.read<SearchCubit>().fetchSearchBooks(query: query);
              }
            },
            onSubmitted: (query) {
              if (query.isNotEmpty) {
                context.read<SearchCubit>().fetchSearchBooks(query: query);
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidgets(
            errMessage: state.errMessage,
          );
        } else if (state is SearchBooksLoading) {
          return const CustomLoadingIndicator();
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Books'.toUpperCase(),
                  style: Styles.textStyle30.copyWith(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'start searching now'.toUpperCase(),
                  style: Styles.textStyle30.copyWith(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
