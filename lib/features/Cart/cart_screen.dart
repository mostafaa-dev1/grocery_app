import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/cubit/cubit.dart';
import 'package:grocery_app/features/Cart/widgets/cart_items.dart';
import 'package:grocery_app/features/Cart/widgets/submit_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cart = AppCubit.get(context).cart;
    return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F7F7),
          title: const Text(
            'Cart',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cart.isEmpty
                        ? Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/empty_cart.png',
                                  height: 200,
                                ),
                                SizedBox(height: 20),
                                const Text('Your cart is empty',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          )
                        : const CartItems(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              cart.isEmpty ? const SizedBox() : const SubmitButton(),
            ],
          ),
        ));
  }
}
