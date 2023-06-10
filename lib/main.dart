import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_crud_reqres/config/routes.config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 872),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: routerConfig,
        theme: ThemeData.light(useMaterial3: true),
      ),
    );
  }
}
