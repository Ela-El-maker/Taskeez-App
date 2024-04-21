import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskeez/constants/values.dart';
import 'package:taskeez/widgets/appLogo/appLogo.dart';
import 'package:taskeez/widgets/darkBackground/darkRadialBackground.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            position: 'topLeft',
            color: HexColor.fromHex('#181a1f'),
          ),
          Positioned(
            child: AppLogo(),
            left: 140,
          ),
          Center(
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: 'Task',
                  style: GoogleFonts.lato(fontSize: 40),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'eez',
                      style: TextStyle(
                        decoration: TextDecoration.none, // Ensure no decoration
                        foreground: Paint()..shader = // Correct usage of shader
                            LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.green,
                              ],
                            ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
