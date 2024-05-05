import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/cubit/cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
      child: Center(
        child: Text(
          "Total Price: \$${AppCubit.get(context).totalPrice}",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.orangeAccent),
        ),
      ),
    );
  }
}
