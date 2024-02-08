
import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
           onPressed: () {},
          backgroundColor: Colors.white,
          title: 'Free',
          textColor: Colors.black,
          bottomLeft: 20,
          topLeft: 20,
          horizontalPadding: 55,
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        CustomButton(
          onPressed: () {},
          backgroundColor: const Color(0xffef8262),
          title: 'Preview',
          textColor: Colors.white,
          bottomRight: 20,
          topRight: 20,
          horizontalPadding: 50,
          verticalPadding: 14,
          style: Styles.textStyle16.copyWith(
            fontFamily: kGilroyFont,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
