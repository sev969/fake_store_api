import 'package:fake_store_api/bloc/bloc/load_goods_bloc.dart';
import 'package:fake_store_api/constants/app_constants.dart';
import 'package:fake_store_api/ui/widgets/custom_nav_bar.dart';
import 'package:fake_store_api/ui/widgets/single_goods_widget.dart';
import 'package:fake_store_api/ui/widgets/sub_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllGoodsScreen extends StatelessWidget {
  const AllGoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loadGoodsBloc = BlocProvider.of<LoadGoodsBloc>(context);
    loadGoodsBloc.add(StartLoadGoodsEvent(goodsUrl: AppConstants.allGoodsUrl));
    return Scaffold(
      appBar: AppBar(
        title: const Text("All goods"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<LoadGoodsBloc, LoadGoodsState>(
            builder: (context, state) {
          if (state is LoadGoodsStartedState) {
            return const CircularProgressIndicator.adaptive();
          } else if (state is LoadGoodsCompliteState) {
            final List listGoods = state.goodsList;
            return Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
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
                                            )));
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
                        }),
                  ),
                ),
                const CustomNavBar(),
              ],
            );
          } else if (state is LoadGoodsErrorState) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  state.errorMessage,
                ),
              ),
            );
          }
          return const Text("Hi");
        }),
      ),
    );
  }
}
