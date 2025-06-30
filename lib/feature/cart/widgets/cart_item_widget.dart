import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/cart/bloc/cart_bloc.dart';
import 'package:pottery/feature/cart/bloc/events/cart_event.dart';
import 'package:pottery/feature/cart/models/cart_model.dart';
import 'package:pottery/feature/cart/widgets/confirm_delete_item.dart';
import 'package:pottery/feature/cart/widgets/quantity_edit_dialog.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Dismissible(
        key: ValueKey(item.productId),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) async {
          return await showDialog<bool>(
              context: context,
              builder: (context) => const ConfirmDeleteItem());
        },
        onDismissed: (direction) {
          context.read<CartBloc>().add(RemoveFromCart(item.productId));
        },
        background: Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(0.0),
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        context.read<CartBloc>().add(
                              UpdateCartItemQuantity(
                                item.productId,
                                item.quantity + 1,
                              ),
                            );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final int? newQuantity = await showDialog<int>(
                        context: context,
                        builder: (context) =>
                            QuantityEditDialog(initialQuantity: item.quantity),
                      );
                      if (newQuantity != null) {
                        context.read<CartBloc>().add(
                              UpdateCartItemQuantity(
                                item.productId,
                                newQuantity,
                              ),
                            );
                      }
                    },
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.quantity.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.error,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.remove),
                      onPressed: item.quantity > 1
                          ? () {
                              context.read<CartBloc>().add(
                                    UpdateCartItemQuantity(
                                        item.productId, item.quantity - 1),
                                  );
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
