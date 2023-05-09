import 'package:flutter/material.dart';
import 'package:m1_idtw/widgets/modules_grid.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/MainScreeen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Modules"),
      ),
      body: const ModulesGrid(),
    );
  }
}
