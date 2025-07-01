import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/cart/bloc/events/cart_event.dart';
import 'package:pottery/feature/cart/bloc/states/cart_state.dart';
import 'package:pottery/feature/cart/models/cart_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartLoaded([])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UndoRemoveFromCart>(_onUndo);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<ClearCart>(_onClearCart);
    on<FetchCart>(_onFetchCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final current = state is CartLoaded
        ? (state as CartLoaded).items
        : (state as CartItemRemoved).items;

    final items = List<CartItem>.from(current);
    final index = items.indexWhere((i) => i.productId == event.item.productId);

    if (index >= 0) {
      // item is exist
      final updated = items[index].copyWith(
        quantity: items[index].quantity + 1,
      );
      items[index] = updated;
    } else {
      items.add(event.item);
    }
    emit(CartLoaded(items));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final current = state is CartLoaded
        ? (state as CartLoaded).items
        : (state as CartItemRemoved).items;
    final updated = List<CartItem>.from(current);
    final item = updated.firstWhere((e) => e.productId == event.productId);
    updated.remove(item);
    // updated.removeWhere((e) => e.productId == event.productId);
    emit(CartItemRemoved(updated, item));
  }

  void _onUndo(UndoRemoveFromCart event, Emitter<CartState> emit) {
    final current =
        state is CartItemRemoved ? (state as CartItemRemoved).items : [];

    final updated = List<CartItem>.from(current)..add(event.item);
    emit(CartLoaded(updated));
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
      final List<CartItem> fetchedItems = [];
      emit(CartLoaded(fetchedItems));
    } catch (e) {
      emit(const CartError('Failed to fetch cart.'));
    }
  }
}
