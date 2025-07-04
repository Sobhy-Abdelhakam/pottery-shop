import 'package:equatable/equatable.dart';
import 'package:pottery/feature/cart/models/cart_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final CartItem item;

  const AddToCart(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveFromCart extends CartEvent {
  final String productId;

  const RemoveFromCart(this.productId);

  @override
  List<Object> get props => [productId];
}

class UndoRemoveFromCart extends CartEvent {
  final CartItem item;
  const UndoRemoveFromCart(this.item);
  @override
  List<Object> get props => [item];
}

class UpdateCartItemQuantity extends CartEvent {
  final String productId;
  final int quantity;

  const UpdateCartItemQuantity(this.productId, this.quantity);

  @override
  List<Object> get props => [productId, quantity];
}

class ClearCart extends CartEvent {}

class FetchCart extends CartEvent {}