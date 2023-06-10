import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashViewState();
  }
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    ///set splash screen 3s and then redirect to intro
    Future.delayed(
      const Duration(seconds: 3),
      () => context.go('/intro'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo/logo.png'),
      ),
    );
  }
}
