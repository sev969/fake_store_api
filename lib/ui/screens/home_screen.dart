import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_store_api/bloc/bloc/category_bloc.dart';
import 'package:fake_store_api/constants/app_constants.dart';
import 'package:fake_store_api/ui/screens/sub_category_screen.dart';
import 'package:fake_store_api/ui/widgets/category_widget.dart';
//import 'package:fake_store_api/bloc/bloc/theme_ctrl_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [];

    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc.add(ReadCategoryEvent());
    List<String> images = [
      "assets/images/elektronics.jpg",
      "assets/images/jewelery.jpg",
      "assets/images/mens_clothing.jpg",
      "assets/images/womens_clothing.jpg",
    ];

    List<String> categoryName = [
      "Electronics",
      "Jewelery",
      "Men's clothing",
      "Women's clothing",
    ];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Catalog of goods",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: [
                Image.asset("assets/images/laptop.jpg"),
                Image.asset("assets/images/jewelery1.jpg"),
                Image.asset("assets/images/mens_clothing1.jpg"),
                Image.asset("assets/images/womens_clothing1.jpg"),
              ],
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                //onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoryLoadedState) {
                    categories = state.categories;
                    return GridView.builder(
                        itemCount: categories.length,
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubCategoryScreen(
                                      categoryUrl: AppConstants
                                          .subCategoryListUrls[index],
                                      categoryName: categoryName[index],
                                    ),
                                  ),
                                );
                              },
                              child: CategoryWidget(
                                categotyName: categories[index],
                                imgPath: images[index],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Text("Error read categories");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
