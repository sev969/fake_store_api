import 'package:fake_store_api/ui/screens/all_goods_screen.dart';
import 'package:fake_store_api/ui/screens/home_page.dart';
import 'package:fake_store_api/ui/screens/profile_screen.dart';
import 'package:fake_store_api/ui/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  icon: const Icon(Icons.home)),
              const Text("Home"),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllGoodsScreen()));
                  },
                  icon: const Icon(Icons.map)),
              const Text("All goods"),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShoppingCartScreen()));
                  },
                  icon: const Icon(Icons.shopping_cart)),
              const Text("Cart"),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  },
                  icon: const Icon(Icons.person_2)),
              const Text("Profile"),
            ],
          ),
        ],
      ),
    );
  }
}
