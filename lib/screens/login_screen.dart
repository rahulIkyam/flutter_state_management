import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final loginProvider  =Provider.of<LoginProvider>(context);
    print("````build````");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 10,),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                loginProvider.login(emailController.text, passwordController.text);
              },
              child: loginProvider.loading ? const CircularProgressIndicator() : const Text("Login", style: TextStyle(color: Colors.white, fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}
