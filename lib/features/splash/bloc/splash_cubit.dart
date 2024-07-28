import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/router/routing_utils.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  static SplashCubit get to => SplashCubit();

  void init() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ),
            () => RoutingUtils.router.pushReplacementNamed(RoutingUtils.base));
  }
}
