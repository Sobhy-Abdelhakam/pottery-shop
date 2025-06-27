import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/landing/bloc/landing_cubit.dart';
import 'package:pottery/feature/landing/bloc/landing_state.dart';
import 'package:pottery/feature/landing/widgets/landing_page_content_widget.dart';
import 'package:pottery/congifures/app_color.dart';
import 'package:pottery/feature/landing/models/landing_page_model.dart';
import 'package:pottery/feature/main_navigation/view/main_navigation_view.dart';

class LandingPagesView extends StatefulWidget {
  const LandingPagesView({super.key});

  @override
  State<LandingPagesView> createState() => _LandingPagesViewState();
}

class _LandingPagesViewState extends State<LandingPagesView> {
  final PageController _pageController = PageController();

  final List<LandingPageModel> _pageData = [
    LandingPageModel(
      title: "Welcome to Pottery Haven",
      description:
          "Discover exquisite handcrafted pottery, made with passion and precision.",
      imagePath: "assets/landing/pottery_landing.png",
    ),
    LandingPageModel(
      title: "Artistry in Every Curve",
      description:
          "Each piece is a unique work of art, bringing beauty and elegance to your home.",
      imagePath: "assets/landing/pottery fan.jpg",
    ),
    LandingPageModel(
      title: "Your Perfect Piece Awaits",
      description:
          "Explore our diverse collection and find the pottery that speaks to your soul.",
      imagePath: "assets/landing/ancient-pottery.jpg",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LandingCubit, LandingState>(
        listener: (context, state) {
          _pageController.jumpToPage(state.currentPage);
        },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<LandingCubit>().pageChanged(index);
                },
                itemCount: _pageData.length,
                itemBuilder: (context, index) {
                  final pageData = _pageData[index];
                  return LandingPageContentWidget(
                    title: pageData.title,
                    description: pageData.description,
                    imagePath: pageData.imagePath,
                    isLastPage: index == _pageData.length - 1,
                    onNext: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    onSkip: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const MainNavigationView()),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: _buildPageIndicator(state.currentPage),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPageIndicator(int currentPage) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_pageData.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: currentPage == index ? 20 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: currentPage == index
                ? AppColor.primaryColor
                : Colors.grey.withOpacity(0.4),
          ),
        );
      }),
    );
  }
}
