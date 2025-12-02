import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> navPushNamedScreen(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> navPushReplacementNamedScreen(String routeName,
      {Object? argument}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> navPushNamedAndRemoveUntilScreen(String routeName,
      {Object? argument, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }

  void navPopScreen() => Navigator.of(this).pop();
  Future<dynamic> navPushScreen(Widget screen, {Object? argument}) =>
      Navigator.of(this).push(
        MaterialPageRoute(
            builder: (context) => screen,
            settings: RouteSettings(arguments: argument)),
      );

  void navPushAndRemoveUntilScreen(Widget screen,
          {Object? argument, bool routeUseGoRouter = true}) =>
      Navigator.of(this).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => screen,
              settings: RouteSettings(arguments: argument)),
          (Route<dynamic> route) => routeUseGoRouter);
  //#============================IOS Transition=============================
  Future<dynamic> navPushScreenIos(Widget screen, {Object? argument}) =>
      Navigator.of(this).push(
        navIosPageRouteBuilder(argument, screen),
      );
  //! pushAndRemoveUntil not use with GoRouter
  void naviosPushAndRemoveUntilScreen(Widget screen,
          {Object? argument, bool routeUseGoRouter = true}) =>
      Navigator.of(this).pushAndRemoveUntil(
          navIosPageRouteBuilder(argument, screen),
          (Route<dynamic> route) => routeUseGoRouter);
}

PageRouteBuilder<Object?> navIosPageRouteBuilder(
    Object? argument, Widget screen) {
  return PageRouteBuilder(
    settings: RouteSettings(arguments: argument),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return CupertinoPageTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: true,
        child: child,
      );
    },
  );
}
