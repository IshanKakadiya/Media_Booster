// ignore_for_file: camel_case_types, use_build_context_synchronously, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_authentication/Globle.dart';

class logout_page extends StatefulWidget {
  const logout_page({Key? key}) : super(key: key);

  @override
  State<logout_page> createState() => _logout_pageState();
}

getname() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  Globle.name = prefs.getString("isName") ?? "";

  print(Globle.name);
}

class _logout_pageState extends State<logout_page> {
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getname();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Wel-Come"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              isshowDialog();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(flex: 2),
            Text(
              "Wecome ${Globle.name}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  isshowDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.white,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          title: const Text("Are You Sure Log-Out ?"),
          actions: [
            OutlinedButton(
              child: const Text(
                "No",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 5),
            ElevatedButton(
              child: const Text("Yes"),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove("isLogin");

                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              },
            ),
            const SizedBox(width: 10),
          ],
        );
      },
    );
  }
}
