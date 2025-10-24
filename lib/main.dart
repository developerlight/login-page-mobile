import 'package:flutter/material.dart';
import 'utils/route.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/login',
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}
