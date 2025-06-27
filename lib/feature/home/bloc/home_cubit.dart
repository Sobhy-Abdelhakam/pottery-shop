import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/home/bloc/home_state.dart';
import 'package:pottery/feature/home/models/product_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          products: [
            Product(
              productName: 'pottery one',
              price: '\$999.99',
              imageUrl: 'assets/home/products/p1.jpeg',
            ),
            Product(
              productName: 'pottery one',
              price: '\$699.99',
              imageUrl: 'assets/home/products/p1.jpeg',
            ),
            Product(
              productName: 'pottery one',
              price: '\$149.99',
              imageUrl: 'assets/home/products/p1.jpeg',
            ),
            Product(
              productName: 'pottery one',
              price: '\$79.99',
              imageUrl: 'assets/home/products/p1.jpeg',
            ),
          ],
        ));

  void toggleView(bool isGridView) {
    emit(state.copyWith(isGridView: isGridView));
  }
}
