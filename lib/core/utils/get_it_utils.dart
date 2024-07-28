import 'package:get_it/get_it.dart';

import '../../features/base/cubit/base_bloc.dart';
import '../../features/calendar/bloc/calendar_cubit.dart';

final GetIt getIt = GetIt.instance;

T getItInstance<T extends Object>() => getIt.get();

class GetItUtils {
  GetItUtils.init() {
    getIt.registerLazySingleton(() => BaseCubit());
    getIt.registerLazySingleton(() => CalendarCubit());
  }
}
