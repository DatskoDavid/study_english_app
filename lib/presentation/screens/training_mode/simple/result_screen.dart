import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:real_diploma/presentation/screens/bottom_nav_bar_controller.dart';
import 'package:real_diploma/presentation/screens/training_mode/training_home.dart';

import '../../../../domain/models/training_info.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = 'result';

  final TrainingInfo trainingInfo;

  const ResultScreen({super.key, required this.trainingInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            bottom: 10,
            left: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your progress in learn of word',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              CircularPercentIndicator(
                radius: 70.0,
                lineWidth: 13.0,
                animation: true,
                percent: trainingInfo.percent / 100,
                header: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    trainingInfo.word.word,
                    style: const TextStyle(
                        // color: Colors.indigo,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                center: Text(
                  '${trainingInfo.percent.round()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25.0,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.purple,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: 50),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  // height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 220, 221),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'Quiz Mode:',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          trainingInfo.isCorrectQuizAnswer
                              ? _answerIcon(Icons.check)
                              : _answerIcon(Icons.close)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'Input Word Mode:',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          trainingInfo.isCorrectInputWordAnswer
                              ? _answerIcon(Icons.check)
                              : _answerIcon(Icons.close)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomNavBarController.routeName,
              (route) => false,
            );
          }),
    );
  }

  Widget _answerIcon(
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: icon == Icons.check ? Colors.green : Colors.red,
        borderRadius: const BorderRadius.all(
          Radius.circular(100.0),
        ),
      ),
      child: FittedBox(
          child: Icon(icon, color: const Color(0xffffffff), size: 20.0)),
    );
  }
}
