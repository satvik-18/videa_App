import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_app/reelCards.dart';
import 'package:video_app/shorts.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 600;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10),
          children: [
            // Search Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Container(
                height: isTablet ? screenHeight * 0.1 : screenHeight * 0.08,
                padding: EdgeInsets.only(
                  top: isTablet ? screenHeight * 0.04 : screenHeight * 0.02,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Top Picks Header
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(
                'Top Picks',
                style: GoogleFonts.montserrat(
                  fontSize: isTablet ? 24 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Top Picks Content
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Row(
                children: [
                  ShortCard(
                    short: shorts[0],
                    h: screenHeight * 0.4,
                    w: screenWidth * 0.48,
                    autoPlay: true,
                  ),
                  Column(
                    children: [
                      ShortCard(
                        short: shorts[1],
                        h: screenHeight * 0.2,
                        w: screenWidth * 0.48,
                        autoPlay: true,
                      ),
                      ShortCard(
                        short: shorts[2],
                        h: screenHeight * 0.2,
                        w: screenWidth * 0.48,
                        autoPlay: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Dive In Header
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dive in',
                style: GoogleFonts.montserrat(
                  fontSize: isTablet ? 24 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Dive In Horizontal List
            SizedBox(
              height: screenHeight * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return ShortCard(
                    short: shorts[index % shorts.length + 3],
                    h: screenHeight * 0.15,
                    w: isTablet ? screenWidth * 0.25 : screenWidth * 0.375,
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Discover Header
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Discover',
                style: GoogleFonts.montserrat(
                  fontSize: isTablet ? 24 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Discover Grid (2 columns)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Column(
                children: [
                  for (int i = 0; i < 3; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShortCard(
                          short: shorts[i + 6],
                          h: screenHeight * 0.2,
                          w: screenWidth * 0.48,
                        ),
                        ShortCard(
                          short: shorts[i + 9],
                          h: screenHeight * 0.2,
                          w: screenWidth * 0.48,
                        ),
                      ],
                    ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
