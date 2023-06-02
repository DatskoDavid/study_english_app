import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';

import '../widgets/card_of_day.dart';
import '../widgets/word_of_day.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        // appBar: AppBar(
        //   title: const Text('English App'),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Text(
                //     user == null ? 'Logged out' : 'Logged in as: ${user!.email}',
                //     textAlign: TextAlign.center,
                //     style: const TextStyle(fontSize: 16),
                //   ),
                // ),
                SizedBox(height: 20),
                WordOfDay(
                  title: 'Word of the Day',
                  word: 'book',
                  phonetic: '[buk]',
                  buttonCaption: 'Go study',
                  image: 'assets/images/1.png',
                ),
                SizedBox(height: 20),
                CardOfDay(
                  title: 'Article of the Day',
                  description:
                      'What Happens to Your Body When You Eat Oatmeal Every Day',
                  buttonCaption: 'Read',
                  image: 'assets/images/1.png',
                ),
                SizedBox(height: 20),
                CardOfDay(
                  title: 'Chat bot',
                  description: 'A bot',
                  buttonCaption: 'Start',
                  image: 'assets/images/1.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
