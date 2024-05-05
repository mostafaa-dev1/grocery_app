import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/cubit/cubit.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = AppCubit.get(context).cart;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(cart[index]['image']),
              ),
              title: Text(
                cart[index]['title'],
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: FittedBox(
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "\$",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "${cart[index]['price']}",
                            style: const TextStyle(color: Colors.black),
                          ),
                          const TextSpan(
                            text: "/kg",
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "  x${cart[index]['count']}",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
