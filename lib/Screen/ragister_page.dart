// ignore_for_file: camel_case_types, unused_local_variable, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ragister_Page extends StatefulWidget {
  const Ragister_Page({Key? key}) : super(key: key);

  @override
  State<Ragister_Page> createState() => _Ragister_PageState();
}

class _Ragister_PageState extends State<Ragister_Page> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Registration Form"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        height: _height,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  hintText: "Enter Name Here",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "Enter Email Here",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Email-Id";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter Password Here",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white.withOpacity(0.3),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  child: const Text("Register"),
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;
                    String name = nameController.text;

                    if (formKey.currentState!.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      await prefs.setBool("isRegistration", true);
                      await prefs.setString("isName", name);
                      await prefs.setString("isEmail", email);
                      await prefs.setString("isPassword", password);

                      Navigator.of(context).pushReplacementNamed("/");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Enter All Details .......",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 50),
              const Divider(
                color: Colors.white,
                thickness: 1.5,
                indent: 40,
                endIndent: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a Ragister ?"),
                  TextButton(
                    child: const Text("Direct Login"),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
