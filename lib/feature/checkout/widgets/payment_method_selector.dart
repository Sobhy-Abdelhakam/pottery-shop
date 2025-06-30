
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
        const Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...paymentMethods.map((method) {
          return RadioListTile<PaymentMethod>(
            title: Text(method.name),
            value: method,
            groupValue: context.watch<CheckoutBloc>().state.selectedPaymentMethod,
            onChanged: (value) {
              context.read<CheckoutBloc>().add(SelectPaymentMethod(value!));
            },
          );
        }).toList(),
      ],
    );
  }
}
