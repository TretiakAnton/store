import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:store/core/navigation/routes.dart';
import 'package:store/view/screens/home_screen.dart';
import 'package:store/view/screens/login_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginScreen,
      path: Routes.loginScreen,
      initial: true,
    ),
    AutoRoute(
      page: HomeScreen,
      path: Routes.homeScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
