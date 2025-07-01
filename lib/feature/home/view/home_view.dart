import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/home/bloc/home_cubit.dart';
import 'package:pottery/feature/home/bloc/home_state.dart';
import 'package:pottery/feature/home/widgets/carousel_slider.dart';
import 'package:pottery/feature/home/widgets/product_card_widget.dart';
import 'package:pottery/feature/home/widgets/product_view_selection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustumCarouselSlider(),
                      SizedBox(height: 10),
                      ProductViewSelection(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return state.isGridView
                      ? SliverGrid.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: state.products.map((product) {
                            return ProductCardWidget(
                              product: product,
                              isGridView: true,
                            );
                          }).toList(),
                        )
                      : SliverList.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return ProductCardWidget(
                              product: product,
                              isGridView: false,
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
