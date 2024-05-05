import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/cubit.dart';
import 'package:grocery_app/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.product});
  final dynamic product;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  List<Map<String, dynamic>> cart = [

  ];
  int count = 1;
  void addToCart() {
    setState(() {
      cart.add(widget.product);
    });
  }
  String _cartTag = "";
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body :CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 300,
                  leadingWidth: 70,
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                        CupertinoIcons.heart,
                      )
                    ),
                    SizedBox(width: 20),
                  ],
                  flexibleSpace: AspectRatio(
                    aspectRatio: 1.37,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Color(0xFFF8F8F8),
                          child: Hero(
                            tag: widget.product['title'] + _cartTag,
                            child: Image.asset(widget.product['image']),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: const BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Row(
                                children: [
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: CircleBorder(),
                                    elevation: 0,
                                    color: Colors.white,
                                    height: 36,
                                    minWidth: 36,
                                    onPressed: (){
                                      setState(() {
                                        if(count > 1) {
                                          count--;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                   Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20 / 4),
                                    child: Text(
                                      '${count}',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    shape: CircleBorder(),
                                    elevation: 0,
                                    color: Colors.white,
                                    height: 36,
                                    minWidth: 36,
                                    onPressed: (){
                                      setState(() {
                                        count++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child : Column(
                      children: [
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.product['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "\$",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                                  children: const [
                                    TextSpan(
                                      text: '20.00',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "/kg",
                                      style:
                                      TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).Cabbage",
                            style: TextStyle(
                              color: Color(0xFFBDBDBD),
                              height: 1.8,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: (){
                              widget.product.addAll({
                                'count': count,
                                'price': widget.product['price']
                              });
                              AppCubit.get(context).addToCart(widget.product);
                              setState(() {
                                _cartTag = '_cartTag';
                              });
                              print(AppCubit.get(context).cart);
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: HexColor('F37A20'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Add To Cart",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ),
                          ),
                        )
                      ],
                    )
                )
              ],
            )
        );
      },
    );
  }
}
