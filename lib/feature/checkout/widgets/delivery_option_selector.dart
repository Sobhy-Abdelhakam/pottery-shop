
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_event.dart';
import 'package:pottery/feature/checkout/models/delivery_option.dart';

class DeliveryOptionSelector extends StatelessWidget {
  const DeliveryOptionSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delivery Option', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        RadioListTile<DeliveryOption>(
          title: const Text('Home Delivery'),
          value: DeliveryOption.homeDelivery,
          groupValue: context.watch<CheckoutBloc>().state.selectedDeliveryOption,
          onChanged: (value) {
            context.read<CheckoutBloc>().add(SelectDeliveryOption(value!));
          },
        ),
        RadioListTile<DeliveryOption>(
          title: const Text('In-Store Pickup'),
          value: DeliveryOption.inStorePickup,
          groupValue: context.watch<CheckoutBloc>().state.selectedDeliveryOption,
          onChanged: (value) {
            context.read<CheckoutBloc>().add(SelectDeliveryOption(value!));
          },
        ),
      ],
    );
  }
}
