import 'dart:math';

import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/data/articles_fake_data/articles_data.dart';
import 'package:real_diploma/presentation/screens/article_screen.dart';

import '../widgets/card_of_day.dart';
import '../widgets/word_of_day.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final randomArticleIndex = Random().nextInt(2);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                const SizedBox(height: 20),
                const WordOfDay(
                  title: 'Word of the Day',
                  word: 'book',
                  phonetic: '[buk]',
                  buttonCaption: 'Go study',
                  image: 'assets/images/1.png',
                ),
                const SizedBox(height: 20),
                CardOfDay(
                  title: 'Random article',
                  article: articles[randomArticleIndex],
                  buttonCaption: 'Read',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
