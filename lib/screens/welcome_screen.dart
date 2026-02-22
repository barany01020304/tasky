import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF181818),
      //  appBar: AppBar(backgroundColor: Color(0XFF181818)),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/logo.svg"),
                SizedBox(width: 16),
                Text(
                  "Tasky",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 108),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome To Tasky",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFFFFFFFF),
                  ),
                ),
                SizedBox(width: 8),
                SvgPicture.asset("assets/images/waving_hand.svg"),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Your productivity journey starts here.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0XFFFFFFFF),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            SvgPicture.asset("assets/images/welcome_image.svg"),
            SizedBox(height: 28),
            Align(
              alignment:Alignment.centerLeft,
              child: Text("Full Name",style: TextStyle(color: Color(0XFFFFFFFF),fontWeight: FontWeight.w400,fontSize: 16),),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                style: TextStyle(
                  color: Color(0XFFFFFFFF)
                ),
                decoration: InputDecoration(
                  fillColor: Color(0XFF282828),
                  hintText: "e.g. Sarah Khalid",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  )
                ),
              ),
            ),
            SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 42),
                  backgroundColor: Color(0XFF15B86C),
                  foregroundColor: Color(0XFFFFFFFF),
                ),
                child: Text("Let’s Get Started"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
