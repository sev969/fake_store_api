//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fake_store_api/bloc/bloc/load_goods_bloc.dart';
//import 'package:fake_store_api/ui/screens/all_goods_screen.dart';
//import 'package:fake_store_api/ui/screens/home_screen.dart';
//import 'package:fake_store_api/ui/screens/profile_screen.dart';
//import 'package:fake_store_api/ui/screens/shopping_cart_screen.dart';
import 'package:fake_store_api/ui/widgets/custom_nav_bar.dart';
import 'package:fake_store_api/ui/widgets/single_goods_widget.dart';
import 'package:fake_store_api/ui/widgets/sub_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen(
      {super.key, required this.categoryUrl, required this.categoryName});
  final String categoryUrl;
  final String categoryName;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  // int selectedScreen = 4;
  // final List<Widget> bottomBarScreens = [
  //   const HomeScreen(),
  //   const AllGoodsScreen(),
  //   const ShoppingCartScreen(),
  //   const ProfileScreen(),
  // ];
  @override
  @override
  Widget build(BuildContext context) {
    final loadGoodsBloc = BlocProvider.of<LoadGoodsBloc>(context);
    loadGoodsBloc.add(StartLoadGoodsEvent(goodsUrl: widget.categoryUrl));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.categoryName,
          ),
          centerTitle: true,
        ),
        // bottomNavigationBar: ConvexAppBar(
        //   items: const [
        //     TabItem(icon: Icons.home, title: 'Home'),
        //     TabItem(icon: Icons.map, title: 'All goods'),
        //     TabItem(icon: Icons.shopping_cart, title: 'Shopping cart'),
        //     TabItem(icon: Icons.people, title: 'Profile'),
        //   ],
        //   onTap: (int i) {
        //     selectedScreen = i;
        //     setState(() {});
        //   },
        // ),
        body:
            // selectedScreen == 0
            //     ? bottomBarScreens[0]
            //     : selectedScreen == 1
            //         ? bottomBarScreens[1]
            //         : selectedScreen == 2
            //             ? bottomBarScreens[2]
            //             : selectedScreen == 3
            //                 ? bottomBarScreens[3]
            //                 : selectedScreen == 4
            //                     ?
            Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<LoadGoodsBloc, LoadGoodsState>(
                    builder: (context, state) {
                  if (state is LoadGoodsStartedState) {
                    return const CircularProgressIndicator.adaptive();
                  } else if (state is LoadGoodsCompliteState) {
                    final List listGoods = state.goodsList;
                    return ListView.builder(
                        itemCount: listGoods.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SingleGoodsScreen(
                                      goods: listGoods[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SubCategoryWidget(
                                  goods: listGoods[index],
                                ),
                              ),
                            ),
                          );
                        });
                  } else if (state is LoadGoodsErrorState) {
                    return Text(state.errorMessage);
                  }
                  return const Text("Hi");
                }),
              ),
            ),
            const CustomNavBar(),
          ],
        )
        // : bottomBarScreens[0],
        );
  }
}
