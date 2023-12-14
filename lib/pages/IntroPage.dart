import 'package:flutter/material.dart';
import 'package:flutter_restaurantapp/components/button.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 108, 11),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            //shop name

            Text(
              "SuSHI Man",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            //icon

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/sushi1.png'),
            ),

            const SizedBox(height: 25),

            //title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 35,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),
            //subtitle

            const Text(
              "Feel the taste of the most popular Japanese food anywhere and anytime",
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 186, 186, 186),
                  height: 2),
            ),

            const SizedBox(
              height: 25,
            ),

            //getstarted Button
            MyButton(
              text: "Get Started",
              onTap: () {
//go to menu page
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
