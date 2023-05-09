import 'package:flutter/material.dart';

import 'package:m1_idtw/providers/modules_provider.dart';
import 'package:m1_idtw/widgets/module_item.dart';
import 'package:provider/provider.dart';

class ModulesGrid extends StatelessWidget {
  const ModulesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final modulesList = Provider.of<ModuleProvider>(context).modules;

    return LayoutBuilder(
      builder: (ctx, constraint) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 3,
            childAspectRatio: 3 / 2,
            mainAxisExtent:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? constraint.maxWidth / 3
                    : constraint.maxWidth / 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: modulesList[index],
            child:  ModuleItem(key: UniqueKey(),),
          ),
          itemCount: modulesList.length,
        ),
      ),
    );
  }
}
