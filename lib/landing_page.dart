import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/app_colors.dart';
import 'package:quizz/quiz_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.bgcolor,
              AppColors.gradientcolor,
            ],
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FlutterLogo(size: 200),
          SizedBox(height: 10),
          Text(
            '~QUIZZZ~',
            style: GoogleFonts.nunito(
              color: AppColors.selectedcolor,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Let\'s Play ! ! !',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Play and Have fun',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: size.width * 0.85,
            height: 70,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColors.buttoncolor, onPrimary: Colors.white),
              child: Text(
                'Play Now',
                style: GoogleFonts.nunito(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: "Landing Page"),
                      builder: (context) => QuizPage()),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
