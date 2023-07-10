import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "email"
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "password"
              ),
            ),
            const SizedBox(height: 50,),
            InkWell(
              onTap: (){
                authProvider.login(
                    emailController.text.toString(),
                    passwordController.text.toString()
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authProvider.loading? const CircularProgressIndicator(color: Colors.white,): const Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
