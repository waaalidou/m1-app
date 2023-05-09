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
            const Divider(),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                    (Route<dynamic> route) => false)
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: constraints.maxWidth / 30),
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
