import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_app/reelCards.dart';
import 'package:video_app/shorts.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;
    return Scaffold(
      //appBar: AppBar(title: Center(child: Text('Video App'))),
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: isTablet ? screenHeight * 0.04 : screenHeight * 0.02,
                      left: screenWidth * 0.02,
                    ),
                    height: isTablet ? screenHeight * 0.1 : screenHeight * 0.08,
                    width: isTablet ? screenWidth * 0.7 : screenWidth * 0.8,
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
                ],
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Row(
                      children: [
                        ShortCard(
                          short: shorts[0],
                          h: screenHeight * 0.4,
                          w: screenWidth * 0.48,
                        ),

                        Column(
                          children: [
                            ShortCard(
                              short: shorts[0],
                              h: screenHeight * 0.2,
                              w: screenWidth * 0.48,
                            ),
                            ShortCard(
                              short: shorts[0],
                              h: screenHeight * 0.2,
                              w: screenWidth * 0.48,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                  SizedBox(
                    height: screenHeight * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ShortCard(
                          short: shorts[0],
                          h: screenHeight * 0.15,
                          w: isTablet
                              ? screenWidth * 0.25
                              : screenWidth * 0.375,
                        );
                      },
                    ),
                  ),
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

                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.02,
                      right: screenWidth * 0.02,
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Row(
                            children: [
                              for (int i = 0; i < 2; i++)
                                ShortCard(
                                  short: shorts[0],
                                  h: screenHeight * 0.2,
                                  w: screenWidth * 0.48,
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
