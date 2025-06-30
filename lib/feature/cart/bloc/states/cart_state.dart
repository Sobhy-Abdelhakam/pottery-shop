import 'package:equatable/equatable.dart';
import 'package:pottery/feature/cart/models/cart_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object> get props => [message];
}

class CartLoaded extends CartState {
  final List<CartItem> items;

  const CartLoaded(this.items);

  @override
  List<Object> get props => [items];

  double get totalPrice =>
      items.fold(0, (total, current) => total + (current.price * current.quantity));
}

class CartItemRemoved extends CartState {
  final List<CartItem> items;
  final CartItem removedItem;

  const CartItemRemoved(this.items, this.removedItem);

  @override
  List<Object> get props => [items, removedItem];
}