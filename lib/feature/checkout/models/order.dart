
import 'package:pottery/feature/cart/models/cart_model.dart';
import 'package:pottery/feature/checkout/models/delivery_option.dart';
import 'package:pottery/feature/checkout/models/payment_method.dart';

class Order {
  final List<CartItem> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final DeliveryOption deliveryOption;
  final PaymentMethod paymentMethod;

  Order({
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.deliveryOption,
    required this.paymentMethod,
  });
}
