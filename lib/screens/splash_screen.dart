import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/newsLogo.png'),
          RichText(
            text: TextSpan(
              text: 'Tech',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Color.fromARGB(164, 0, 0, 0),
                  fontSize: 28,
                ),
              ),
              children: [
                TextSpan(
                  text: 'Pulse',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(99, 0, 0, 0),
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const SpinKitThreeBounce(
            color: Colors.black,
            size: 30,
          ),
        ],
      ),
    );
  }
}
