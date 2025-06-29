import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/cart/bloc/events/cart_event.dart';
import 'package:pottery/feature/cart/bloc/states/cart_state.dart';
import 'package:pottery/feature/cart/models/cart_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartLoaded([])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<ClearCart>(_onClearCart);
    on<FetchCart>(_onFetchCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      final List<CartItem> updatedItems = List.from(state.items);
      final existingItemIndex = updatedItems.indexWhere(
        (item) => item.productId == event.item.productId,
      );

      if (existingItemIndex != -1) {
        final existingItem = updatedItems[existingItemIndex];
        updatedItems[existingItemIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + 1,
        );
      } else {
        updatedItems.add(event.item);
      }
      emit(CartLoaded(updatedItems));
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      final List<CartItem> updatedItems = List.from(state.items)
        ..removeWhere((item) => item.productId == event.productId);
      emit(CartLoaded(updatedItems));
    }
  }

  void _onUpdateCartItemQuantity(
      UpdateCartItemQuantity event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      final List<CartItem> updatedItems = List.from(state.items);
      final itemIndex = updatedItems.indexWhere(
        (item) => item.productId == event.productId,
      );

      if (itemIndex != -1) {
        if (event.quantity > 0) {
          updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(
            quantity: event.quantity,
          );
        } else {
          updatedItems.removeAt(itemIndex);
        }
        emit(CartLoaded(updatedItems));
      }
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(const CartLoaded([]));
  }

  void _onFetchCart(FetchCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      // Simulate a network request
      await Future.delayed(const Duration(seconds: 1));
      final List<CartItem> fetchedItems = [
        const CartItem(productId: '1', productName: 'Ancient Vase', price: 120.00, imageUrl: 'assets/home/products/p1.jpeg', quantity: 1),
        const CartItem(productId: '2', productName: 'Terracotta Pot', price: 45.50, imageUrl: 'assets/home/products/p1.jpeg', quantity: 2),
      ];
      emit(CartLoaded(fetchedItems));
    } catch (e) {
      emit(const CartError('Failed to fetch cart.'));
    }
  }
}
