import 'package:blockchain_app/app/features/auth/ui/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:blockchain_app/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouterConfig {
  static GoRouter goRouter(AuthenticationCubit cubit) => GoRouter(
        routes: AppRoutes.routes(cubit),
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/',
        
      );
}
