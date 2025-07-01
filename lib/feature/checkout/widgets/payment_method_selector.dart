import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_event.dart';
import 'package:pottery/feature/checkout/models/payment_method.dart';

class PaymentMethodSelector extends StatelessWidget {
  final List<PaymentMethod> paymentMethods;
  const PaymentMethodSelector({super.key, required this.paymentMethods});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Method', style: Theme.of(context).textTheme.titleLarge),
        ...paymentMethods.map((method) {
          return RadioListTile<PaymentMethod>(
            title: Row(
              children: [
                Image.asset(method.icon, width: 30, height: 30),
                const SizedBox(width: 10),
                Text(method.name, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            value: method,
            groupValue:
                context.watch<CheckoutBloc>().state.selectedPaymentMethod,
            onChanged: (value) {
              context.read<CheckoutBloc>().add(SelectPaymentMethod(value!));
            },
          );
        }),
      ],
    );
  }
}
