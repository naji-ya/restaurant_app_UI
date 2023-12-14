import 'package:flutter/material.dart';
import 'package:flutter_restaurantapp/components/button.dart';
import 'package:flutter_restaurantapp/models/food.dart';
import 'package:flutter_restaurantapp/models/shop.dart';
import 'package:flutter_restaurantapp/themes/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  //remove from cart

  void removeFromCart(Food food, BuildContext context) {
    // get access to the shop
    final shop = context.read<Shop>();

    //remove from cart
    shop.removeFromCart(food);
  }

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // customer cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from the cart
                  final Food food = value.cart[index];

                  //get food name
                  final String foodName = food.name;

                  // get food price
                  final String foodPrice = food.price;

                  //return list tile
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: secondaryColor,
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        food.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        food.price,
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: "Pay Now", onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
