import 'package:flutter/material.dart';
import 'package:grocery_app/features/Cart/cart_screen.dart';
import 'package:grocery_app/cubit/cubit.dart';
import 'package:page_transition/page_transition.dart';

class BottomCart extends StatelessWidget {
  const BottomCart({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      bottom: 0,
      left: 0,
      right: 0,
      height: 90,
      child: GestureDetector(
        onVerticalDragUpdate: (_) {
          AppCubit.get(context).calculateTotalPrice();
          Navigator.push(
            context,
            PageTransition(
                child: const CartScreen(),
                type: PageTransitionType.size,
                duration: const Duration(milliseconds: 500),
                alignment: Alignment.bottomCenter,
                reverseDuration: const Duration(milliseconds: 500)),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0xFFEAEAEA),
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.topLeft,
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  const Icon(
                    Icons.keyboard_double_arrow_up,
                    size: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: AppCubit.get(context).cart.length,
                            itemBuilder: (context, index) {
                              return Hero(
                                  tag: AppCubit.get(context).cart[index]
                                          ['title'] +
                                      "_cartTag",
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image(
                                            height: 40,
                                            image: AssetImage(
                                                AppCubit.get(context)
                                                    .cart[index]['image']),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    AppCubit.get(context)
                                                        .cart[index]['count']
                                                        .toString(),
                                                  ),
                                                )))
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          AppCubit.get(context).cart.length.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
