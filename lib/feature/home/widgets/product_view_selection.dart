import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/congifures/app_color.dart';
import 'package:pottery/feature/home/bloc/home_cubit.dart';
import 'package:pottery/feature/home/bloc/home_state.dart';

class ProductViewSelection extends StatelessWidget {
  const ProductViewSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              //?number of products
              "120 product",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.grid_on,
                color: state.isGridView ? AppColor.primaryColor : Colors.grey,
              ),
              onPressed: () {
                context.read<HomeCubit>().toggleView(true);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.list,
                color: !state.isGridView ? AppColor.primaryColor: Colors.grey,
              ),
              onPressed: () {
                context.read<HomeCubit>().toggleView(false);
              },
            ),
          ],
        );
      },
    );
  }
}
