import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> cart = [];
  void addToCart(dynamic product) {
    emit(AddToCartState());
    cart.add(product);
  }

  dynamic totalPrice = 0;
  void calculateTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < cart.length; i++) {
      totalPrice += (cart[i]['price'] * cart[i]['count'])!;
    }
  }

  List<Map<String, dynamic>> products = [
    {"title": "Avocado", "image": "assets/images/fruits.png", 'price': 10},
    {"title": "Broccoli", "image": "assets/images/img_2.png", 'price': 10},
    {"title": "Chips", "image": "assets/images/chips.png", 'price': 15},
    {"title": "Cucumber", "image": "assets/images/img_1.png", 'price': 10},
    {"title": "Milk", "image": "assets/images/milk.png", 'price': 20},
    {"title": "Spicy", "image": "assets/images/spicy.png", 'price': 12.5},
    {"title": "Carrot", "image": "assets/images/img_3.png", 'price': 15.9},
    {"title": "Meal", "image": "assets/images/meal.png", 'price': 55},
    {"title": "Meat", "image": "assets/images/meet.png", 'price': 400},
    {"title": "Fejel", "image": "assets/images/img_4.png", 'price': 10},
    {"title": "Nescafe", "image": "assets/images/nescaffe.png", 'price': 50},
    {"title": "Sugar", "image": "assets/images/sugar.png", 'price': 35},
    {"title": "Radhuni", "image": "assets/images/radhuny.png", 'price': 20},
    {"title": "Cheese", "image": "assets/images/cheese.png", 'price': 20},
  ];

  List<Map<String, dynamic>> categories = [
    {
      "title": "Fruits",
      "image": "assets/images/fruitss.png",
    },
    {
      "title": "BreakFast",
      "image": "assets/images/breakfast.png",
    },
    {
      "title": "Dairy",
      "image": "assets/images/dairy.png",
    },
    {
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
}
