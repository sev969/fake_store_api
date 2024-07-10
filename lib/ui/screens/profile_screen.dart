import 'package:fake_store_api/bloc/bloc/theme_ctrl_bloc.dart';
import 'package:fake_store_api/ui/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCtrlBloc = BlocProvider.of<ThemeCtrlBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Theme: light/dark Theme",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder<ThemeCtrlBloc, ThemeCtrlState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            themeCtrlBloc.add(ThemeSwitchEvent());
                          },
                          icon: state is ThemeCtrlLightMode
                              ? const Icon(Icons.mode_night)
                              : const Icon(Icons.light_mode),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const CustomNavBar(),
          ],
        ),
      ),
    );
  }
}
