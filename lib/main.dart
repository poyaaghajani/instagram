import 'package:flutter/material.dart';
import 'package:instagram_ui/Screens/splash_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(
            fontFamily: 'GB',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
