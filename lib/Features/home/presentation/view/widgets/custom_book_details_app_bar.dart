
import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton( padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 24,
          ),
        ),
        IconButton(padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 24,
          ),
        ),
      ],
    );
  }
}

