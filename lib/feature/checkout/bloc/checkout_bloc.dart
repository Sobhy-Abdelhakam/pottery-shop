import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_event.dart';
import 'package:pottery/feature/checkout/bloc/checkout_state.dart';
import 'package:pottery/feature/checkout/models/delivery_option.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(double initialSubtotal)
      : super(CheckoutState(
          subtotal: initialSubtotal,
          deliveryFee: 10.0, // Default to home delivery fee
          total: initialSubtotal + 10.0,
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
        // Simulate a network call
        await Future.delayed(const Duration(seconds: 2));
        emit(state.copyWith(status: CheckoutStatus.success));
      } catch (_) {
        emit(state.copyWith(status: CheckoutStatus.error));
      }
    });
  }
}
