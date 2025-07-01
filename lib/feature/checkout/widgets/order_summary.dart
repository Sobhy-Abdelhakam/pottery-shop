import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;

  const OrderSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order Summary', style: Theme.of(context).textTheme.titleLarge),
        ListTile(
          title: Text('Subtotal', style: Theme.of(context).textTheme.bodyLarge),
          trailing:
              Text('\$$subtotal', style: Theme.of(context).textTheme.bodyLarge),
        ),
        ListTile(
          title: Text('Delivery Fee',
              style: Theme.of(context).textTheme.bodyLarge),
          trailing: Text('\$$deliveryFee',
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        const Divider(),
        ListTile(
          title: Text('Total', style: Theme.of(context).textTheme.titleLarge),
          trailing:
              Text('\$$total', style: Theme.of(context).textTheme.titleLarge),
        ),
      ],
    );
  }
}
