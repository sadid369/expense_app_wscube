import 'package:expense_app/screens/add_trans/add_transaction_page.dart';
import 'package:expense_app/screens/splash/splash_page.dart';
import 'package:expense_app/screens/user_onboarding/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(provider.isDark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const AddTransactionPage(),
    );
  }
}
