import 'package:flutter/material.dart';
import '../models/user.dart';
import '../root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLogedin = false;


void _login(){
  String email = _usernameController.text;
  String password = _passwordController.text;

if (users.any((user) => user.username == email && user.password == password)) {
      setState(() { isLogedin = true; });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Berhasil"), backgroundColor: Colors.green),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Root()),
      );
    } 
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login gagal"), backgroundColor: Colors.red),
      );
    }
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login Page"),
              const SizedBox(height: 20),
              _emailField(_usernameController),
              const SizedBox(height: 10),
              _passwordField(_passwordController),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: const Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emailField(TextEditingController usernameController) {
  return TextField(
    controller: usernameController,
    enabled: true,
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(
      hintText: "username kamu",
      labelText: "Username",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );
}

Widget _passwordField(TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: true,
    enabled: true,
    decoration: const InputDecoration(
      hintText: "password kamu",
      labelText: "Password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );
}