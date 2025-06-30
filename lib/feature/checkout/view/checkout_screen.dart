import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/cart/models/cart_model.dart';
import 'package:pottery/feature/checkout/bloc/checkout_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_event.dart';
import 'package:pottery/feature/checkout/bloc/checkout_state.dart';
import 'package:pottery/feature/checkout/models/payment_method.dart';
import 'package:pottery/feature/checkout/view/order_confirmation_screen.dart';
import 'package:pottery/feature/checkout/widgets/delivery_option_selector.dart';
import 'package:pottery/feature/checkout/widgets/payment_method_selector.dart';
import 'package:pottery/feature/checkout/widgets/order_summary.dart';

class CheckoutScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final double subtotal;

  const CheckoutScreen(
      {super.key, required this.cartItems, required this.subtotal});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(subtotal),
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
                  OrderSummary(
                    subtotal: state.subtotal,
                    deliveryFee: state.deliveryFee,
                    total: state.total,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: state.selectedDeliveryOption != null &&
                              state.selectedPaymentMethod != null
                          ? () {
                              context.read<CheckoutBloc>().add(SubmitOrder());
                            }
                          : null,
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
