import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/home/bloc/home_cubit.dart';
import 'package:pottery/feature/home/bloc/home_state.dart';
import 'package:pottery/feature/home/widgets/product_card_widget.dart';

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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(height: 300.0),
                        items: [
                          'assets/home/1.jpg',
                          'assets/home/2.jpg',
                          'assets/home/3.jpg',
                          'assets/home/4.jpg',
                          'assets/home/5.jpg',
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.asset(i, fit: BoxFit.cover),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "120 product",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(
                                  Icons.grid_on,
                                  color: state.isGridView ? Colors.blue : Colors.grey,
                                ),
                                onPressed: () {
                                  context.read<HomeCubit>().toggleView(true);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.list,
                                  color:
                                      !state.isGridView ? Colors.blue : Colors.grey,
                                ),
                                onPressed: () {
                                  context.read<HomeCubit>().toggleView(false);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
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
