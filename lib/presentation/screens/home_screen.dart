import 'package:flutter/material.dart';

import '../widgets/card_of_day.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('English App'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: const [
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Text(
              //     user == null ? 'Logged out' : 'Logged in as: ${user!.email}',
              //     textAlign: TextAlign.center,
              //     style: const TextStyle(fontSize: 16),
              //   ),
              // ),
              SizedBox(height: 20),
              CardOfDay(
                title: 'Article of the Day',
                description:
                    'What Happens to Your Body When You Eat Oatmeal Every Day',
                buttonCaption: 'Read',
                image: 'assets/1.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
