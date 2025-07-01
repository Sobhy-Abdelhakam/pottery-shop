import 'package:pottery/feature/home/models/product_model.dart';

class HomeState {
  final List<Product> products;
  final bool isGridView;
  final bool isFav;

  const HomeState({
    this.products = const [],
    this.isGridView = true,
    this.isFav = false,
  });

  HomeState copyWith({
    List<Product>? products,
    bool? isGridView,
    bool? isFav,
  }) {
    return HomeState(
      products: products ?? this.products,
      isGridView: isGridView ?? this.isGridView,
      isFav: isFav ?? this.isFav,
    );
  }
}
