import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM architecture flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
