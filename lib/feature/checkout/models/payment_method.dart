abstract class PaymentMethod {
  String get name;
  String get icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentMethod &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class VisaPayment extends PaymentMethod {
  @override
  String get name => 'Visa';
  @override
  String get icon => 'assets/icons/visa.png';
}

class VodafoneCashPayment extends PaymentMethod {
  @override
  String get name => 'Vodafone Cash';
  @override
  String get icon => 'assets/icons/digital-wallet.png';
}

class CashOnDeliveryPayment extends PaymentMethod {
  @override
  String get name => 'Cash on Delivery';
  @override
  String get icon => 'assets/icons/cash.png';
}
