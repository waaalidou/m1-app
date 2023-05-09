import 'package:flutter/material.dart';
import 'package:m1_idtw/providers/modules_provider.dart';
import 'package:m1_idtw/screens/module_details.dart';
import 'package:provider/provider.dart';

class ModuleItem extends StatelessWidget {
  const ModuleItem({super.key});

  @override
  Widget build(BuildContext context) {
    final singleModule = Provider.of<Module>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ModuleDetails.routeName, arguments: singleModule.code);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            alignment: Alignment.topLeft,
            child: Text(
              singleModule.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}
