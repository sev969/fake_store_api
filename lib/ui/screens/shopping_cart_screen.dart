import 'package:fake_store_api/bloc/bloc/shop_cart_bloc.dart';
import 'package:fake_store_api/models/shopping_cart_model.dart';
//import 'package:fake_store_api/ui/screens/confirm_screen.dart';
import 'package:fake_store_api/ui/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    final shoppingCartBloc = BlocProvider.of<ShopCartBloc>(context);
    shoppingCartBloc.add(PriceShopCartEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping cart"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                //height: MediaQuery.of(context).size.height * 0.75,
                child: BlocConsumer<ShopCartBloc, ShopCartState>(
                  listener: (context, state) {
                    if (state is PriceShopCartState) {
                      totalPrice = state.totalPrice;
                    }
                    if (state is ShopCartAddededState) {
                      shoppingCartBloc.add(PriceShopCartEvent());
                    }
                    if (state is DeletedGoodsFromShopCartState) {
                      shoppingCartBloc.add(PriceShopCartEvent());
                    }
                    if (state is IncQuantityGoodsInShopCartState) {
                      shoppingCartBloc.add(PriceShopCartEvent());
                    }
                    if (state is DecQuantityGoodsInShopCartState) {
                      shoppingCartBloc.add(PriceShopCartEvent());
                    }
                  },
                  builder: (context, state) {
                    if (state is ShopCartAddededState) {
                      return Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              //height: MediaQuery.of(context).size.height * 0.55,
                              child: buildShoppingCart(state),
                            ),
                          ),
                          Text(
                            'Total price: ${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    } else if (state is DeletedGoodsFromShopCartState) {
                      return Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              //height: MediaQuery.of(context).size.height * 0.55,
                              child: buildShoppingCart(state),
                            ),
                          ),
                          Text(
                            'Total price: ${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    } else if (state is IncQuantityGoodsInShopCartState) {
                      return Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              //height: MediaQuery.of(context).size.height * 0.55,
                              child: buildShoppingCart(state),
                            ),
                          ),
                          Text(
                            'Total price: ${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    } else if (state is DecQuantityGoodsInShopCartState) {
                      return Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              //height: MediaQuery.of(context).size.height * 0.55,
                              child: buildShoppingCart(state),
                            ),
                          ),
                          Text(
                            'Total price: ${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    } else if (state is PriceShopCartState) {
                      return Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              //height: MediaQuery.of(context).size.height * 0.55,
                              child: buildShoppingCart(state),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Total price: ${totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 18,
                            ),
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
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                  shadowColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                onPressed: totalPrice > 0
                                    ? () {
                                        final shopCartBloc =
                                            BlocProvider.of<ShopCartBloc>(
                                                context);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         const ConfirmSccren(),
                                        //   ),
                                        // );
                                        shopCartBloc
                                            .add(ClearGoodsInShopCartEvent());
                                      }
                                    : null,
                                child: const Text(
                                  'Buy now',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text("No goods");
                    }
                  },
                ),
              ),
            ),
          ),
          const CustomNavBar(),
        ],
      ),
    );
  }

  Widget buildShoppingCart(state) {
    final shoppingCartBloc = BlocProvider.of<ShopCartBloc>(context);
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.95,
      child: ListView.builder(
          itemCount: state.goods.length,
          itemBuilder: (context, index) {
            ShoppingCartModel goods = state.goods[index];
            return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(goods.imgUrl),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            goods.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Price: \$${(goods.price * goods.quantity!.toInt()).toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            shoppingCartBloc.add(
                                IncQuantityGoodsInShopCartEvent(index: index));
                          },
                          icon: const Icon(Icons.add),
                        ),
                        Text((goods.quantity.toString())),
                        IconButton(
                          onPressed: () {
                            shoppingCartBloc.add(
                                DecQuantityGoodsInShopCartEvent(index: index));
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        shoppingCartBloc
                            .add(DeleteGoodsFromShopCartEvent(index: index));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
