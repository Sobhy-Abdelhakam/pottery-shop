import 'package:pottery/feature/home/models/product_model.dart';

class HomeState {
  final List<Product> products;
  final bool isGridView;

  const HomeState({
    this.products = const [],
    this.isGridView = true,
  });

  HomeState copyWith({
    List<Product>? products,
    bool? isGridView,
  }) {
    return HomeState(
      products: products ?? this.products,
      isGridView: isGridView ?? this.isGridView,
    );
  }
}
