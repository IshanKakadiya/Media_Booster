// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_authentication/Globle.dart';
import 'package:user_authentication/Screen/logout_page.dart';
import 'package:user_authentication/Screen/ragister_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences perfs = await SharedPreferences.getInstance();

  bool? isRegistration = perfs.getBool("isRegistration") ?? false;
  bool? isLogin = perfs.getBool("isLogin") ?? false;
  String? isName = perfs.getString("isName") ?? "";

  await perfs.setBool("isRegistration", isRegistration);
  await perfs.setBool("isLogin", isLogin);
  await perfs.setString("isName", isName);

  Globle.name = isName;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // initialRoute: "Ragister_Page",
      initialRoute: (isRegistration)
          ? (isLogin)
              ? "logout_page"
              : "/"
          : "Ragister_Page",
      routes: {
        "/": (context) => const MyApp(),
        "logout_page": (context) => const logout_page(),
        "Ragister_Page": (context) => const Ragister_Page(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
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
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "Enter Email Here",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter Password Here",
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                value: rememberMe,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.all(0),
                title: const Text("Remember Me"),
                onChanged: (val) {
                  setState(() {
                    rememberMe = val!;
                  });
                },
              ),
              const SizedBox(height: 15),
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
                  child: const Text("Login"),
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;

                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    String emailRagister = prefs.getString("isEmail") ?? "";
                    String passwordRagister =
                        prefs.getString("isPassword") ?? "";
                    Globle.name = prefs.getString("isName") ?? "";
                    print(name);

                    if (email == emailRagister &&
                        password == passwordRagister) {
                      await prefs.setBool("isLogin", true);

                      Navigator.of(context).pushReplacementNamed("logout_page");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Somwthig Wrong.......",
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
                  const Text("Not a Ragister ?"),
                  TextButton(
                    child: const Text("Create Account"),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed("Ragister_Page");
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
