import 'package:email_validator/email_validator.dart';
import 'package:fake_store_api/bloc/bloc/load_goods_bloc.dart';
import 'package:fake_store_api/bloc/bloc/shop_cart_bloc.dart';
import 'package:fake_store_api/ui/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmSccren extends StatefulWidget {
  const ConfirmSccren({super.key});

  @override
  State<ConfirmSccren> createState() => _ConfirmSccrenState();
}

class _ConfirmSccrenState extends State<ConfirmSccren> {
  bool isEmailValid = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loadGoodsBloc = BlocProvider.of<LoadGoodsBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Confirmation",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                    //),
                    const SizedBox(
                      height: 180,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(8.0),
                    // child: Column(
                    //   children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Input your name",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: emailController,
                      onChanged: (value) {
                        isEmailValid = EmailValidator.validate(value);
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Input your email",
                      ),
                    ),
                    SizedBox(
                        child: isEmailValid
                            ? const Text("")
                            : const Text(
                                "Please input valid email",
                                style: TextStyle(color: Colors.red),
                              )),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
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
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: isEmailValid
                            ? () {
                                final shopCartBloc =
                                    BlocProvider.of<ShopCartBloc>(context);

                                loadGoodsBloc.add(SendEmailEvent(
                                    email: emailController.text.trim(),
                                    toName: nameController.text));
                                shopCartBloc.add(ClearGoodsInShopCartEvent());
                                Navigator.pop(context);
                              }
                            : null,
                        child: const Text(
                          "Send",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
