import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ringo_test/features/auth/pages/login_view.dart';
import 'package:ringo_test/features/base/base_view.dart';
import 'package:ringo_test/features/splash/pages/splash_page.dart';

import '../../features/auth/cubit/login_cubit.dart';

BuildContext? get ctx =>
    RoutingUtils.router.routerDelegate.navigatorKey.currentContext;

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class RoutingUtils {
  static const String splash = '/';
  static const String login = '/login';
  static const String base = '/base';



  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: routes,
    observers: [routeObserver],
  );
  static List<GoRoute> routes = <GoRoute>[
    GoRoute(
      path: splash,
      name: splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: login,
      name: login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: base,
      name: base,
      builder: (context, state) => const BaseView(),
    ),
  ];
}
