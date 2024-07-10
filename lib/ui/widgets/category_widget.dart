import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.categotyName, required this.imgPath});
  final String categotyName;
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            categotyName,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            imgPath,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
