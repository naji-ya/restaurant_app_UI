import 'package:flutter/material.dart';
import 'package:flutter_restaurantapp/components/button.dart';
import 'package:flutter_restaurantapp/models/shop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_restaurantapp/themes/colors.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;
  //quantity

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increment quantity

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  addToCart() {
    // add to cart if there is something in the cart

    if (quantityCount > 0) {
      // get access to the shop
      final shop = context.read<Shop>();
      //add to the cart
      shop.addToCart(widget.food, quantityCount);

      // let the user  know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            //OK BUTTON

            IconButton(
              onPressed: () {
                // POP ONCE TO REMOVE THE DIALOG BOX
                Navigator.pop(context);

                // POP AGAIN TO GO BACK TO THE PREVIOUS PAGE
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // image

                  Image.asset(
                    widget.food.imagepath,
                    height: 200,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[900],
                      ),

                      const SizedBox(
                        width: 5,
                      ),
//ratings
                      Text(
                        widget.food.ratings,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),

//food name
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  //description
                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    "While the fish should be an opaque white, beige, or brown on the outside depending on the cooking method, it should still be a slightly translucent pink in the center. If the center of the salmon is opaque, it's likely overcooked.Baked and grilled salmon has a similar texture. They are both cooked through, so the flesh is firm but moist and flaky. ",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // listview of food details
          const SizedBox(
            width: 0,
          ),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // quantity

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        //quantity count
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        //plus button
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),
                MyButton(text: "Add To Cart", onTap: addToCart)
              ],
            ),
          ),

          // add to card button
        ],
      ),
    );
  }
}
