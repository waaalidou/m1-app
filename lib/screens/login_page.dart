import 'package:flutter/material.dart';
import 'package:m1_idtw/providers/user_provider.dart';
import 'package:m1_idtw/screens/admin_screen.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  static const routeName = '/loginpage';

  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formkey = GlobalKey<FormState>();
  final _passwordNode = FocusNode();
  var _showPassword = true;
  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Welcome!"),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const AdminScreen(),
          ),
          (Route<dynamic> route) => false);
      
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Welcom Home!",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: MediaQuery.of(context).size.width / 10),
                ),
              ),
              const SizedBox(height: 45),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter value please';
                  } else if (!Provider.of<Users>(context, listen: false)
                      .checkUsername(value)) {
                    return 'enter valid username';
                  }
                  return null;
                },
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_passwordNode),
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: _showPassword,
                focusNode: _passwordNode,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: _showPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  hintText: 'Username',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter value please';
                  } else if (!Provider.of<Users>(context, listen: false)
                      .checkUPassword(value)) {
                    return 'enter valid password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              OutlinedButton(
                onPressed: _saveForm,
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
