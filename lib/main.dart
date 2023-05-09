import 'package:flutter/material.dart';
import 'package:m1_idtw/providers/modules_provider.dart';
import 'package:m1_idtw/providers/user_provider.dart';
import 'package:m1_idtw/screens/admin_screen.dart';
import 'package:m1_idtw/screens/main_screen.dart';
import 'package:m1_idtw/screens/module_details.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Users()),
        ChangeNotifierProvider(create: (_) => ModuleProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(primary: Colors.teal, secondary: Colors.orange),
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineMedium: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
        ),
        home: const HomePage(),
        routes: {
          LogInPage.routeName: (context) => const LogInPage(),
          MainScreen.routeName: (context) => const MainScreen(),
          AdminScreen.routeName : (context) => const AdminScreen(),
          ModuleDetails.routeName : (ctx) => const ModuleDetails(),
        },
      ),
    );
  }
}
