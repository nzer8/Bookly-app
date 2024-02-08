
import 'package:bookly_app/Features/home/presentation/view/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can Also Like',
          style: Styles.textStyle14,
        ),
        SizedBox(
          height: 16,
        ),
        SimilarBooksLisView(),
      ],
    );
  }
}
