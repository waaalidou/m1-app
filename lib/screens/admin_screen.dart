import 'package:flutter/material.dart';
import 'package:m1_idtw/widgets/drawer.dart';
import 'package:m1_idtw/widgets/single_module.dart';
import 'package:provider/provider.dart';

import '../providers/modules_provider.dart';

class AdminScreen extends StatelessWidget {
  static const routeName = '/AdminScreen';
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modulesList = Provider.of<ModuleProvider>(context).modules;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: modulesList[index],
          child: SingleModule(
            key: UniqueKey(),
            name: modulesList[index].name,
            code: modulesList[index].code,
          ),
        ),
        itemCount: modulesList.length,
      ),
    );
  }
}
