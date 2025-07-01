
import 'package:pottery/feature/checkout/models/delivery_option.dart';
import 'package:pottery/feature/checkout/models/payment_method.dart';

abstract class CheckoutEvent {}

class SelectPaymentMethod extends CheckoutEvent {
  final PaymentMethod paymentMethod;

  SelectPaymentMethod(this.paymentMethod);
}

class SelectDeliveryOption extends CheckoutEvent {
  final DeliveryOption deliveryOption;

  SelectDeliveryOption(this.deliveryOption);
}

class SubmitOrder extends CheckoutEvent {}
