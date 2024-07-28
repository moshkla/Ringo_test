import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/get_it_utils.dart';
import 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseState(0));

  static BaseCubit get to => getIt.get();

  set currentIndex(int index) => emit(state.copyWith(selectedIndex: index));

  void jumpToPage(int index) => currentIndex = index;
}
