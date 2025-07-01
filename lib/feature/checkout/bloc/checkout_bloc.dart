import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_event.dart';
import 'package:pottery/feature/checkout/bloc/checkout_state.dart';
import 'package:pottery/feature/checkout/models/delivery_option.dart';

import 'package:pottery/feature/cart/models/cart_model.dart';
import 'package:pottery/feature/checkout/models/order.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(double initialSubtotal, List<CartItem> cartItems)
      : super(CheckoutState(
          subtotal: initialSubtotal,
          deliveryFee: 10.0, // Default to home delivery fee
          total: initialSubtotal + 10.0,
          cartItems: cartItems,
        )) {
    on<SelectPaymentMethod>((event, emit) {
      emit(state.copyWith(selectedPaymentMethod: event.paymentMethod));
    });

    on<SelectDeliveryOption>((event, emit) {
      double newDeliveryFee = 0.0;
      if (event.deliveryOption == DeliveryOption.homeDelivery) {
        newDeliveryFee = 10.0; // Example home delivery fee
      }
      final newTotal = state.subtotal + newDeliveryFee;
      emit(state.copyWith(
        selectedDeliveryOption: event.deliveryOption,
        deliveryFee: newDeliveryFee,
        total: newTotal,
      ));
    });

    on<SubmitOrder>((event, emit) async {
      emit(state.copyWith(status: CheckoutStatus.loading));
      try {
        if (state.selectedPaymentMethod == null ||
            state.selectedDeliveryOption == null) {
          emit(state.copyWith(status: CheckoutStatus.error));
          return;
        }

        final order = Order(
          items: state.cartItems,
          subtotal: state.subtotal,
          deliveryFee: state.deliveryFee,
          total: state.total,
          deliveryOption: state.selectedDeliveryOption!,
          paymentMethod: state.selectedPaymentMethod!,
        );

        // In a real application, you would send this 'order' object to a backend service.
        // For now, we'll just simulate a delay.
        await Future.delayed(const Duration(seconds: 2));
        print('Order created: ${order.total}'); // For demonstration
        emit(state.copyWith(status: CheckoutStatus.success));
      } catch (e) {
        emit(state.copyWith(status: CheckoutStatus.error));
      }
    });
  }
}
