import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/checkout/bloc/checkout_event.dart';
import 'package:pottery/feature/checkout/bloc/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState()) {
    on<SelectPaymentMethod>((event, emit) {
      emit(state.copyWith(selectedPaymentMethod: event.paymentMethod));
    });

    on<SelectDeliveryOption>((event, emit) {
      emit(state.copyWith(selectedDeliveryOption: event.deliveryOption));
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
