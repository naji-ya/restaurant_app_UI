import 'package:flutter/material.dart';
import 'package:flutter_restaurantapp/components/button.dart';
import 'package:flutter_restaurantapp/models/shop.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/foodtile.dart';

import '../pages/foodDetailsPage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    super.key,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigated to the food details
  void navigatedToFoodDetails(int index) {
    // get the shop and gets the menu

    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and gets the menu

    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: const Color.fromARGB(222, 242, 238, 238),
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        title: const Center(
          child: Text(
            'Tokyo',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart_sharp))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 108, 11),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text(
                      'Get 35% promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //Radeem button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),

                //image
                Image.asset(
                  'lib/images/sushi2.png',
                  height: 100,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          //search bar

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search'),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(174, 11, 10, 10),
              ),
            ),
          ),

          //menu list

          const SizedBox(
            height: 5,
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                onTap: () => navigatedToFoodDetails(index),
                food: foodMenu[index],
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(235, 247, 241, 241),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //image
                    Image.asset(
                      'lib/images/sushi1.png',
                      height: 60,
                    ),
                    //name and price

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
//name

                        Text(
                          'Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        //price

                        const Text(
                          '\$21.00',
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 61, 61),
                          ),
                        )
                      ],
                    ),

                    //heart icon
                  ],
                ),
                //image

                //heart icon

                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          )
          //popular food
        ],
      ),
    );
  }
}
