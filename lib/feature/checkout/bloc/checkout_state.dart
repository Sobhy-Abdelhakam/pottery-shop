
import 'package:pottery/feature/checkout/models/delivery_option.dart';
import 'package:pottery/feature/checkout/models/payment_method.dart';

enum CheckoutStatus { initial, loading, success, error }

class CheckoutState {
  final PaymentMethod? selectedPaymentMethod;
  final DeliveryOption? selectedDeliveryOption;
  final CheckoutStatus status;

  CheckoutState({
    this.selectedPaymentMethod,
    this.selectedDeliveryOption,
    this.status = CheckoutStatus.initial,
  });

  CheckoutState copyWith({
    PaymentMethod? selectedPaymentMethod,
    DeliveryOption? selectedDeliveryOption,
    CheckoutStatus? status,
  }) {
    return CheckoutState(
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
      selectedDeliveryOption: selectedDeliveryOption ?? this.selectedDeliveryOption,
      status: status ?? this.status,
    );
  }
}
