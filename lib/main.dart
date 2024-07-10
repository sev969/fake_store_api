import 'package:fake_store_api/bloc/bloc/category_bloc.dart';
import 'package:fake_store_api/bloc/bloc/load_goods_bloc.dart';
import 'package:fake_store_api/bloc/bloc/shop_cart_bloc.dart';
import 'package:fake_store_api/bloc/bloc/theme_ctrl_bloc.dart';
import 'package:fake_store_api/repositories/dio_settings.dart';
import 'package:fake_store_api/repositories/net_services.dart';
import 'package:fake_store_api/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetCategories(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCtrlBloc(),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              repository: RepositoryProvider.of<GetCategories>(context),
            ),
          ),
          BlocProvider(
            create: (context) => LoadGoodsBloc(
              repository: RepositoryProvider.of<GetCategories>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ShopCartBloc([]),
          ),
        ],
        child: BlocBuilder<ThemeCtrlBloc, ThemeCtrlState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state is ThemeCtrlLightMode
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
