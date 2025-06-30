import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/cart/bloc/cart_bloc.dart';
import 'package:pottery/feature/cart/bloc/states/cart_state.dart';
import 'package:pottery/feature/checkout/view/checkout_screen.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                  ),
                  onPressed: () {
                    final cartState = context.read<CartBloc>().state;
                    if (cartState is CartLoaded) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                            cartItems: cartState.items,
                            subtotal: cartState.totalPrice,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Checkout'),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
