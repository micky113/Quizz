import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/app_colors.dart';
import 'package:quizz/question.dart';
import 'package:quizz/quiz_controller.dart';

QuizController qc = QuizController();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

List<Icon> scoreTracker = [];

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userAnswer) {
    setState(() {
      if (qc.isEnded() == true) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: "Succeses",
            confirmBtnText: "PLay again",
            confirmBtnColor: AppColors.buttoncolor,
            showCancelBtn: true,
            cancelBtnText: 'Quit',
            onCancelBtnTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            onConfirmBtnTap: () {
              Navigator.pop(context);
              qc.reset();
            });
        scoreTracker.clear();
        qc.reset();
      } else {
        if (userAnswer == qc.correctAnswer) {
          scoreTracker.add(
            Icon(
              Icons.check_circle,
              color: AppColors.buttoncolor,
            ),
          );
        } else {
          scoreTracker.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        qc.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '*** QUIZzzz ***',
          style: GoogleFonts.actor(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 5,
                  child: Center(
                      child: Text(
                    qc.getQuestion,
                    style:
                        GoogleFonts.nunito(fontSize: 30, color: Colors.white),
                    textAlign: TextAlign.center,
                  ))),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.buttoncolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Correct',
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      'InCorrect',
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                    }),
              ),
              SizedBox(height: size.height * 0.05),
              Row(children: scoreTracker)
            ],
          ),
        ),
      ),
    );
  }
}
