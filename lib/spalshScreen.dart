// ignore_for_file: camel_case_types, file_names, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class spalshScreen_Page extends StatefulWidget {
  const spalshScreen_Page({Key? key}) : super(key: key);

  @override
  State<spalshScreen_Page> createState() => _spalshScreen_PageState();
}

PageController pageController = PageController();

class _spalshScreen_PageState extends State<spalshScreen_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (val) {
          setState(() {});
        },
        children: const [
          Page1Component(),
          Page2Component(),
          Page3Component(),
        ],
      ),
    );
  }
}

class Page1Component extends StatelessWidget {
  const Page1Component({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/intro.jpg"),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page2Component extends StatelessWidget {
  const Page2Component({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: InkWell(
            onTap: () {
              pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/intro2.jpg"),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page3Component extends StatelessWidget {
  const Page3Component({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setBool("isIntroVal", true);

              Navigator.of(context).pushReplacementNamed("/");
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/intro.jpg"),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
