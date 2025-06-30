
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
        const Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ListTile(
          title: const Text('Subtotal'),
          trailing: Text('\$$subtotal'),
        ),
        ListTile(
          title: const Text('Delivery Fee'),
          trailing: Text('\$$deliveryFee'),
        ),
        const Divider(),
        ListTile(
          title: const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Text('\$$total', style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
