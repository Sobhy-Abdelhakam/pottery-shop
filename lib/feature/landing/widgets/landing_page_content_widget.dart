import 'package:flutter/material.dart';
import 'package:pottery/congifures/app_color.dart';
// import 'package:pottery/feature/home/view/home_view.dart';
import 'package:pottery/utils/customs/button_custom.dart';

class LandingPageContentWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const LandingPageContentWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onNext,
    required this.onSkip,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: AppColor.mint,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: AppColor.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[800],
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                if (isLastPage)
                  CustomButton(
                    isPrimary: true,
                    text: "GO",
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //       builder: (context) => const HomePage()),
                      // );
                    },
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: "Skip",
                        onPressed: onSkip,
                        isPrimary: false,
                      ),
                      CustomButton(
                        text: "Next",
                        onPressed: onNext,
                        isPrimary: true,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
