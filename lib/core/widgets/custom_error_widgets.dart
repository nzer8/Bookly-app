import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidgets extends StatelessWidget {
  const CustomErrorWidgets({Key? key, required this.errMessage})
      : super(key: key);

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Center(
        child: Text(
          errMessage,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(
            fontSize: 25,
            color: Colors.grey
          ),
        ),
      ),
    );
  }
}
