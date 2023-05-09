import 'package:flutter/material.dart';
import 'package:m1_idtw/providers/modules_provider.dart';
import 'package:provider/provider.dart';

class SingleModule extends StatelessWidget {
  final String name;
  final String code;
  const SingleModule({
    super.key,
    required this.name,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: FittedBox(
              child: Text(
                code,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Text(name),
          trailing: IconButton(
            onPressed: () {
              Provider.of<ModuleProvider>(context, listen: false)
                  .deleteModule(code);
            },
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ),
    );
  }
}
