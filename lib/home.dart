import 'package:flutter/material.dart';
import 'package:m1_idtw/screens/login_page.dart';
import 'package:m1_idtw/screens/main_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthValue =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? 500.0
            : 150.0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widthValue,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LogInPage.routeName);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                child: Text(
                  "Professor",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: widthValue,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MainScreen.routeName);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                child: Text(
                  "Student",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
