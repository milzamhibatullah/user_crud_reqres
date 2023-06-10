import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_crud_reqres/view/home/home.view.dart';
import 'package:user_crud_reqres/view/intro/intro.view.dart';
import 'package:user_crud_reqres/view/splash.view.dart';

/// setup routes config for this app
/// set initial route to splash screen
final GoRouter routerConfig = GoRouter(routes: <RouteBase>[
  ///define initial route
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return SplashView();
    },
  ),
  ///define intro routes
  GoRoute(
    path: '/intro',
    builder: (BuildContext context, GoRouterState state) {
      return IntroView();
    },
  ),
  ///define home routes
  GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return HomeView();
    },
  ),
]);
