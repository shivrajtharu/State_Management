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
  ValueNotifier<bool>toggle = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("build");
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  } else if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return null;
                  } else {
                    return 'Enter valid email';
                  }
                },
                decoration: const InputDecoration(
                  hintText: "email"
                ),
              ),
              const SizedBox(height: 20,),
             ValueListenableBuilder(
                 valueListenable: toggle,
                 builder: (context, value, child){
                   return TextFormField(
                     obscureText: toggle.value,
                     controller: passwordController,
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'Password is required';
                       }
                       return null;
                     },
                     decoration: InputDecoration(
                         hintText: "password",
                         suffix: InkWell(
                             onTap: (){
                               toggle.value = !toggle.value;
                               },
                             child: Icon(toggle.value?Icons.visibility_off_outlined : Icons.visibility)
                         ),
                     ),
                   );
               }),
              const SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  authProvider.login(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                  );},
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
      ),
    );
  }
}
