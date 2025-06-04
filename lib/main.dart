import 'package:flutter/material.dart';
import 'package:video_app/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video App',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4A90E2), 
          onPrimary: Colors.white,
          secondary: Color(0xFF7B8D9E), 
          onSecondary: Colors.white,
          background: Colors.white, 
          onBackground: Colors.black, 
          surface: Color(0xFFF5F7FA), 
          onSurface: Colors.black,
          error: Colors.red.shade700,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 162, 162, 162),
          elevation: 4,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        textTheme: Typography.blackCupertino.copyWith(
          titleLarge: const TextStyle(fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      home: Home_Page(),
    );
  }
}
