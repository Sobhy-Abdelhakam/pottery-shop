import 'package:flutter/material.dart';
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
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: widget.isGridView
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
            ),
    );
  }
}