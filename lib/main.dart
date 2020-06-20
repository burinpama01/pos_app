import 'package:flutter/material.dart';
import 'package:posapp/pages/home.dart';
import 'package:posapp/pages/page_login.dart';
import 'package:provider/provider.dart';
import 'notifier/auth_notifier.dart';
import 'notifier/product_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? HomePage() : Login();
        },
      ),
    );
  }
}
