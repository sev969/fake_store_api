import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  const GradientElevatedButton(
      {super.key, required this.buttonText, required this.buttonFunction});

  final String buttonText;
  final Function buttonFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          buttonFunction();
          // shoppingCartBloc.add(
          //     AddGoodsToShopCartEvent(addededGoods: addededGoods));
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          shadowColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
