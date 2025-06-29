import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/cart/bloc/cart_bloc.dart';
import 'package:pottery/feature/cart/bloc/events/cart_event.dart';
import 'package:pottery/feature/cart/bloc/states/cart_state.dart';
import 'package:pottery/feature/cart/widgets/cart_item_widget.dart';
import 'package:pottery/feature/cart/widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: BlocListener<CartBloc, CartState>(
        listenWhen: (prev, curr) => curr is CartItemRemoved,
        listener: (context, state) {
          if (state is CartItemRemoved) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${state.removedItem.productName} removed'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  context
                      .read<CartBloc>()
                      .add(UndoRemoveFromCart(state.removedItem));
                },
              ),
              duration: const Duration(seconds: 4),
            ));
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartError) {
              return Center(child: Text(state.message));
            } else if (state is CartError) {
              return const Center(child: Text('Something went wrong.'));
            }

            final items = state is CartLoaded
                ? state.items
                : (state is CartItemRemoved ? state.items : []);

            if (items.isEmpty) {
              return const Center(
                child: Text('Your cart is empty.'),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(item: items[index]);
                    },
                  ),
                ),
                const CartTotal(),
              ],
            );
          },
        ),
      ),
    );
  }
}
