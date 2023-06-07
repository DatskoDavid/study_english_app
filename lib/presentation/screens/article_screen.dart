import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/dimens.dart';

import '../../constants/text_styles.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                      ),
                      Text(
                        'Back',
                        style: AppTextStyles.smallText,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //                 TODO:

                    // 	- Column
                    // 		- Text
                    // 		- Image
                    // 		- Text

                    const Text(
                      'What Happens to Your Body When You Eat Oatmeal Every Day',
                      style: AppTextStyles.titleText,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 130,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.large,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.big,
                        ),
                        child: Image.asset(
                          'assets/images/1.png',
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.large,
                        ),
                      ),
                      child: const Text(
                        '''It's a good thing medical experts recommend oatmeal as a healthy breakfast—there's so much you can do with a container of oats. You can enjoy them warm, soak them overnight, bake them into bars or muffins, or even blend them into a waffle batter. Yet besides such delicious versatility, why exactly do health experts recommend oatmeal as a go-to morning meal? How does a simple bowl of oats affect your long-term health? Here's what the science says about consuming oatmeal on a regular basis.
        Oats are a great source of fiber, a carbohydrate that the body cannot digest. Because fiber slows down digestion, you won't feel as hungry for a longer period, per the Centers for Disease Control and Prevention. Eating fiber-rich foods helps avoid spikes and dips in your blood sugar levels 
        while reducing feelings of hunger. "Having oats for breakfast or incorporated into different foods as meals and 
        snacks is a great way to give the meal more staying power and help you feel fuller for longer," says Maggie Michalczyk, RDN. According to the USDA's FoodData Central, 1 cup of cooked oatmeal contains 4 grams of fiber, which is 16% of
         the recommended daily value.''',
                        style: AppTextStyles.mediumText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
