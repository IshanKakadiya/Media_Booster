// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intro_screen/spalshScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences perfs = await SharedPreferences.getInstance();

  bool? isIntroVal = perfs.getBool("isIntroVal") ?? false;

  await perfs.setBool("isIntroVal", isIntroVal);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isIntroVal) ? "/" : "spalshScreen_Page",
      routes: {
        "/": (context) => const MyApp(),
        "spalshScreen_Page": (context) => const spalshScreen_Page(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Wel-Come"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setBool("isIntroVal", false);

              Navigator.of(context).pushReplacementNamed("spalshScreen_Page");
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Wel-Come"),
      ),
    );
  }
}
