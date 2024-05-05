import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  List<Map<String,dynamic>> categories = [
    {
      "title": "Fruits",
      "image": "assets/images/fruitss.png",
    },
    {
      "title": "BreakFast",
      "image": "assets/images/breakfast.png",
    },{
      "title": "Dairy",
      "image": "assets/images/dairy.png",
    },{
      "title": "Beverages",
      "image": "assets/images/beverages.png",
    },
    {
      "title": "Meat&Fish",
      "image": "assets/images/meat&fish.png",
    },
    {
      "title": "Snacks",
      "image": "assets/images/snacks.png",
    }

  ];
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
        title: Text(
            'Categories',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25
          )
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: width > 500 ? 3:2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: width > 500 ? 1.5: 1.2
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categories[index]['image'],
                  ),
                  Text(
                    categories[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
                ]
              ),
            )
          );
        },
      ),
    );
  }
}
