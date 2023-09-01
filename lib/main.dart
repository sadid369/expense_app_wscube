import 'package:expense_app/raf/pro.dart';
import 'package:expense_app/raf/test.dart';
import 'package:expense_app/screens/splash/splash_page.dart';
import 'package:expense_app/screens/user_onboarding/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => Pro(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Pro>(context);
    // print(provider.isDark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider.themeMode,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const LoginPage(),
    );
  }
}
