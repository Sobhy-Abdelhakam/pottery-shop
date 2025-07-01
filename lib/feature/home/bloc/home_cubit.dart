import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/home/bloc/home_state.dart';
import 'package:pottery/feature/home/models/product_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          products: [
            Product(
              productName: 'Pretty Vase',
              price: 20.5,
              imageUrl: 'assets/home/products/vase1.png',
              id: 1,
            ),
          ],
        ));
  void toggleView(bool isGridView) {
    emit(state.copyWith(isGridView: isGridView));
  }

  void toggleFav(bool isFav) {
    emit(state.copyWith( isFav: isFav));
  }
}
