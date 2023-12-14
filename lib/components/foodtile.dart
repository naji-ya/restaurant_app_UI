import 'package:flutter/material.dart';
import 'package:flutter_restaurantapp/models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? onTap;
  FoodTile({super.key,
   required this.food,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(235, 247, 241, 241),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(left: 25.0),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //IMAGE
            Image.asset(
              food.imagepath,
              width: 140,
            ),
    
            //text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
              ),
            ),
    
            // price + rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
    
                  Text(
                    '\$${food.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 59, 54, 54),
                    ),
                  ),
    
                  //rating
    
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(239, 242, 175, 6),
                      ),
                    ],
                  ),
    
                  Text(
                    food.ratings,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
