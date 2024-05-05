import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/features/Cart/cart_screen.dart';
import 'package:grocery_app/categories.dart';
import 'package:grocery_app/core/themes/colors.dart';
import 'package:grocery_app/cubit/cubit.dart';
import 'package:grocery_app/cubit/states.dart';
import 'package:grocery_app/features/Home/widgets/buttom_cart.dart';
import 'package:grocery_app/features/Home/widgets/categories.dart';
import 'package:grocery_app/features/Home/widgets/favourites.dart';
import 'package:grocery_app/features/Home/widgets/location.dart';
import 'package:grocery_app/features/Home/widgets/products.dart';
import 'package:grocery_app/setting.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:page_transition/page_transition.dart';

import '../../details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      scroll();
    });
  }

  void scroll() {
    double pos = _controller.position.pixels;
    print(pos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.removeListener(() {
      scroll();
    });
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var width = MediaQuery.of(context).size.width;
        return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              title: const Text(
                'Gorcery',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconBroken.Notification,
                      size: 27,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const Settings(),
                              type: PageTransitionType.leftToRight));
                    },
                    icon: const Icon(IconBroken.Setting, size: 27)),
              ],
            ),
            body: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Location(),
                          SizedBox(
                            height: 30,
                          ),
                          FavouritesItems(),
                          CategoriesItems(),
                          SizedBox(
                            height: 30,
                          ),
                          ProductsItems(),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    BottomCart(),
                  ],
                )));
      },
    );
  }
}
