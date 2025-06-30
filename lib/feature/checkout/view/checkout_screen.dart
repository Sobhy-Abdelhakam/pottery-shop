import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_event.dart';
import 'package:pottery/feature/checkout/bloc/checkout_state.dart';
import 'package:pottery/feature/checkout/models/payment_method.dart';
import 'package:pottery/feature/checkout/view/order_confirmation_screen.dart';
import 'package:pottery/feature/checkout/widgets/delivery_option_selector.dart';
import 'package:pottery/feature/checkout/widgets/payment_method_selector.dart';
import 'package:pottery/feature/checkout/widgets/order_summary.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state.status == CheckoutStatus.success) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const OrderConfirmationScreen(),
                ),
              );
            } else if (state.status == CheckoutStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('An error occurred. Please try again.')),
              );
            }
          },
          builder: (context, state) {
            if (state.status == CheckoutStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const DeliveryOptionSelector(),
                  const SizedBox(height: 20),
                  PaymentMethodSelector(
                    paymentMethods: [
                      VisaPayment(),
                      VodafoneCashPayment(),
                      CashOnDeliveryPayment(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const OrderSummary(
                    subtotal: 100.0, // Replace with actual data
                    deliveryFee: 10.0, // Replace with actual data
                    total: 110.0, // Replace with actual data
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: () {
                        context.read<CheckoutBloc>().add(SubmitOrder());
                      },
                      child: const Text('Submit Order'),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
