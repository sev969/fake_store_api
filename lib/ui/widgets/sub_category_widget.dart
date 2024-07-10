import 'package:fake_store_api/models/goods_model.dart';
import 'package:flutter/material.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({
    super.key,
    required this.goods,

    // required this.category,
    // required this.title,
    // required this.imgUrl,
    // required this.description,
    // required this.rating,
    // required this.count,
    // required this.price,
  });

  final GoodsModel goods;

  //final String category;
  // final String title;
  // final String imgUrl;
  // final String description;
  // final double rating;
  // final int count;
  // final double price;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              goods.category ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              goods.title ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Image.network(
              goods.image ?? '',
              fit: BoxFit.cover,
            ),
            Text(
              "Price: ${goods.price}\$",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            Text(
              goods.description ?? '',
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star_rate,
                      color: index < goods.rating!.toDouble()
                          ? Colors.yellow
                          : Colors.grey,
                    ),
                  ),
                ),
                Text(
                  "Sold: ${goods.count}",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
