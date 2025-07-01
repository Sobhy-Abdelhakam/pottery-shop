
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
        Text('Delivery Option', style: Theme.of(context).textTheme.titleLarge),
        RadioListTile<DeliveryOption>(
          title: Text('Home Delivery', style: Theme.of(context).textTheme.bodyLarge),
          value: DeliveryOption.homeDelivery,
          groupValue: context.watch<CheckoutBloc>().state.selectedDeliveryOption,
          onChanged: (value) {
            context.read<CheckoutBloc>().add(SelectDeliveryOption(value!));
          },
        ),
        RadioListTile<DeliveryOption>(
          title: Text('In-Store Pickup', style: Theme.of(context).textTheme.bodyLarge),
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
