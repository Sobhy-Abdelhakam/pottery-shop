import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final int productId;
  final String productName;
  final double price;
  final int quantity;

  final String imageUrl;

  const CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      productId: productId,
      productName: productName,
      price: price,
      imageUrl: imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [productId, productName, price, quantity, imageUrl];
}