import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/congifures/app_color.dart';
import 'package:pottery/feature/home/bloc/home_cubit.dart';
import 'package:pottery/feature/home/bloc/home_state.dart';
import 'package:pottery/feature/home/models/product_model.dart';

class GridProductCardWidget extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const GridProductCardWidget({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          children: [
            Image.asset(
              product.imageUrl,
              height: MediaQuery.of(context).size.height * 0.12,
              fit: BoxFit.fill,
            ),
            Text(
              product.productName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                product.price.toString() + r"$",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(85, 255, 165, 81),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                    color: AppColor.primaryColor,
                  ),
                  onPressed: onIncrement,
                  visualDensity: VisualDensity.compact, // Reduce button size
                ),
              ),
            ]),
          ],
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  bool isfav = !state.isFav;
                 context.read<HomeCubit>().toggleFav(isfav);
                },
                icon: Icon(
                  size: 30,
                  state.isFav ? Icons.favorite : Icons.favorite_outline_sharp,
                  color: AppColor.primaryColor,
                ));
          },
        ),
      ],
    );
  }
}
