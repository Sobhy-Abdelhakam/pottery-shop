import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pottery/feature/landing/bloc/landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(const LandingState(currentPage: 0));

  void pageChanged(int pageIndex) => emit(LandingState(currentPage: pageIndex));
}
