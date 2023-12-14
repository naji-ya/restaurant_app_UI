import 'package:flutter/cupertino.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    Food(
        name: 'Salmon sushi',
        price: '25.00',
        imagepath: 'lib/images/sushi3.png',
        ratings: '4.3'),

    //sushi
    Food(
        name: 'tuna ',
        price: '29.00',
        imagepath: 'lib/images/sushi4.png',
        ratings: '4.9')
    // tuna
  ];

//customer cart
  final List<Food> _cart = [];

  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart

  void removeFromCart(Food food) {
    _cart.remove(food);
  }

  @override
  void notifyListeners();
}
