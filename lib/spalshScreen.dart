// ignore_for_file: camel_case_types, file_names, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                "assets/intro1-removebg-preview.png",
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Discuss\nIdeas",
                  style: GoogleFonts.josefinSans(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Lorgm ipushm dolor sit amet\nconsectetur adipiscing",
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 110),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 3),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
                const SizedBox(width: 3),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                "assets/intro2-removebg-preview.png",
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Online\nMarketing",
                  style: GoogleFonts.josefinSans(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Lorgm ipushm dolor sit amet\nconsectetur adipiscing",
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 110),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
                const SizedBox(width: 3),
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 3),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                "assets/intro3-removebg-preview.png",
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Project\nDelivered",
                  style: GoogleFonts.josefinSans(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Lorgm ipushm dolor sit amet\nconsectetur adipiscing",
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 110),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
                const SizedBox(width: 3),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.black.withOpacity(0.3),
                ),
                const SizedBox(width: 3),
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setBool("isIntroVal", true);

                    Navigator.of(context).pushReplacementNamed("/");
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
