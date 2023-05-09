import 'package:flutter/material.dart';
import 'package:m1_idtw/providers/modules_provider.dart';
import 'package:provider/provider.dart';

class ModuleDetails extends StatelessWidget {
  const ModuleDetails({super.key});
  static const routeName = "/ModuleDetails";
  Widget rowBuilder(String rowTitle, String value, BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$rowTitle: ",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 17),
            ),
            Expanded(
              child: Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 17),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final specificModule =
        Provider.of<ModuleProvider>(context, listen: false).findByCode(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(specificModule.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            rowBuilder("Name", specificModule.name, context),
            rowBuilder("Code", specificModule.code, context),
            rowBuilder("Professor", specificModule.professor, context),
            rowBuilder("Coeff", specificModule.coeff.toString(), context),
            rowBuilder("Description", specificModule.description, context),
          ],
        ),
      ),
    );
  }
}
