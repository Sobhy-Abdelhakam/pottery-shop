import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/cart/bloc/cart_bloc.dart';
import 'package:pottery/feature/cart/bloc/events/cart_event.dart';
import 'package:pottery/feature/cart/models/cart_model.dart';
import 'package:pottery/feature/home/models/product_model.dart';
import 'package:pottery/feature/home/widgets/grid_product_card_widget.dart';
import 'package:pottery/feature/home/widgets/list_product_card_widget.dart';

class ProductCardWidget extends StatefulWidget {
  final Product product;
  final bool isGridView;

  const ProductCardWidget({
    super.key,
    required this.product,
    this.isGridView = true,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  int _quantity = 0;

  void _incrementQuantity() {
    BlocProvider.of<CartBloc>(context).add(AddToCart(CartItem(
      productId: widget.product.id,
      productName: widget.product.productName,
      price: widget.product.price,
      imageUrl: widget.product.imageUrl,
    )));
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isGridView
        ? GridProductCardWidget(
            product: widget.product,
            quantity: _quantity,
            onIncrement: _incrementQuantity,
            onDecrement: _decrementQuantity,
          )
        : ListProductCardWidget(
            product: widget.product,
            quantity: _quantity,
            onIncrement: _incrementQuantity,
            onDecrement: _decrementQuantity,
          );
  }
}
