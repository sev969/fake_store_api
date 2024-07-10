//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
//import 'package:fake_store_api/bloc/bloc/theme_ctrl_bloc.dart';
import 'package:fake_store_api/ui/screens/all_goods_screen.dart';
import 'package:fake_store_api/ui/screens/home_screen.dart';
import 'package:fake_store_api/ui/screens/profile_screen.dart';
import 'package:fake_store_api/ui/screens/shopping_cart_screen.dart';
import 'package:fake_store_api/ui/screens/sub_category_screen.dart';
import 'package:fake_store_api/ui/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedScreen = 0;
  @override
  Widget build(BuildContext context) {
    //final themeCtrlBloc = BlocProvider.of<ThemeCtrlBloc>(context);

    final List<Widget> bottomBarScreens = [
      const HomeScreen(),
      const AllGoodsScreen(),
      const ShoppingCartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Store"),
        centerTitle: true,
        // actions: [
        //   BlocBuilder<ThemeCtrlBloc, ThemeCtrlState>(
        //     builder: (context, state) {
        //       return IconButton(
        //         onPressed: () {
        //           themeCtrlBloc.add(ThemeSwitchEvent());
        //         },
        //         icon: state is ThemeCtrlLightMode
        //             ? const Icon(Icons.mode_night)
        //             : const Icon(Icons.light_mode),
        //       );
        //     },
        //   ),
        // ],
      ),
      drawer: SafeArea(
        child: Container(
          color: Colors.grey.withOpacity(0.9),
          width: MediaQuery.of(context).size.width * 0.8,
          //height: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 60,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "    Select category:",
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                            categoryUrl:
                                "https://fakestoreapi.com/products/category/electronics",
                            categoryName: "Electronics",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Electronics",
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                            categoryUrl:
                                "https://fakestoreapi.com/products/category/jewelery",
                            categoryName: "Jewelery",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Jewelery",
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                            categoryUrl:
                                "https://fakestoreapi.com/products/category/men's clothing",
                            categoryName: "Men's clothing",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Men's clothing",
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                            categoryUrl:
                                "https://fakestoreapi.com/products/category/women's clothing",
                            categoryName: "Woman's clothing",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Womans clothing",
                      style: TextStyle(fontSize: 20),
                    )),
                const Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const Text(
                  "Created using API from https://fakestoreapi.com Thenk's for author",
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "Copyright: sev969@gmail.com",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
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
      body: Column(
        children: [
          Expanded(
            child: Container(child: bottomBarScreens[selectedScreen]),
          ),
          const CustomNavBar(),
        ],
      ),
    );
  }
}
