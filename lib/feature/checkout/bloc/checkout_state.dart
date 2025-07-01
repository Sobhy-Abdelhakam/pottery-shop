import 'package:pottery/feature/cart/models/cart_model.dart';
import 'package:pottery/feature/checkout/models/delivery_option.dart';
import 'package:pottery/feature/checkout/models/payment_method.dart';

enum CheckoutStatus { initial, loading, success, error }

class CheckoutState {
  final PaymentMethod? selectedPaymentMethod;
  final DeliveryOption? selectedDeliveryOption;
  final CheckoutStatus status;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final List<CartItem> cartItems;

  CheckoutState({
    this.selectedPaymentMethod,
    this.selectedDeliveryOption,
    this.status = CheckoutStatus.initial,
    required this.subtotal,
    this.deliveryFee = 0.0,
    required this.total,
    required this.cartItems,
  });

  CheckoutState copyWith({
    PaymentMethod? selectedPaymentMethod,
    DeliveryOption? selectedDeliveryOption,
    CheckoutStatus? status,
    double? subtotal,
    double? deliveryFee,
    double? total,
    List<CartItem>? cartItems,
  }) {
    return CheckoutState(
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      selectedDeliveryOption:
          selectedDeliveryOption ?? this.selectedDeliveryOption,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
