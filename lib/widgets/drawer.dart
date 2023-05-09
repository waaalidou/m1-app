import 'package:flutter/material.dart';
import 'package:m1_idtw/home.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Drawer(
        child: Column(
          children: [
            AppBar(
              title: const Text("Menu"),
              automaticallyImplyLeading: false,
            ),
            GestureDetector(
              onTap: () => {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Are you sure"),
                    content: const Text("Do you want to log out ?"),
                    actions: <Widget>[
                      OutlinedButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                      ),
                      OutlinedButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth / 30,
                    vertical: constraints.maxHeight / 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout, size: 30),
                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
