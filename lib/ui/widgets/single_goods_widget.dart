import 'package:fake_store_api/bloc/bloc/shop_cart_bloc.dart';
import 'package:fake_store_api/models/goods_model.dart';
import 'package:fake_store_api/models/shopping_cart_model.dart';
import 'package:fake_store_api/ui/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleGoodsScreen extends StatelessWidget {
  const SingleGoodsScreen({super.key, required this.goods});

  final GoodsModel goods;

  @override
  Widget build(BuildContext context) {
    final shoppingCartBloc = BlocProvider.of<ShopCartBloc>(context);
    final ShoppingCartModel addededGoods = ShoppingCartModel(
        id: goods.count!,
        title: goods.title!,
        imgUrl: goods.image!,
        price: goods.price!);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fake store",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            // height: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        goods.category!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        goods.title!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.network(
                        goods.image!,
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
                        goods.description!,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star_rate,
                                color: index < goods.rating!
                                    ? Colors.yellow
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                            "Sold: ${goods.count}",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   decoration: const BoxDecoration(
                      //     gradient: LinearGradient(
                      //       colors: [Colors.amber, Colors.red],
                      //     ),
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(10),
                      //     ),
                      //   ),
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       shoppingCartBloc.add(
                      //           AddGoodsToShopCartEvent(addededGoods: addededGoods));
                      //     },
                      //     style: const ButtonStyle(
                      //       backgroundColor:
                      //           MaterialStatePropertyAll(Colors.transparent),
                      //       shadowColor: MaterialStatePropertyAll(Colors.transparent),
                      //     ),
                      //     child: const Text(
                      //       "Add to cart",
                      //       style: TextStyle(fontSize: 24),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber, Colors.red],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  shoppingCartBloc
                      .add(AddGoodsToShopCartEvent(addededGoods: addededGoods));
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  shadowColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                child: const Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          const CustomNavBar(),
        ],
      ),
    );
  }
}
