// ignore_for_file: depend_on_referenced_packages, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallary_image_app/Globle.dart';
import 'package:gallary_image_app/screen/slider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const MyApp(),
        "Slider_Page": (context) => const Slider_Page(),
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
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallary App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Globle.index = 0;
                });
                Navigator.of(context).pushNamed("Slider_Page");
              },
              child: Container(
                height: _height * 0.2,
                width: _width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("${Globle.nature[0]}"),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Nature",
                  style: GoogleFonts.carterOne(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.2,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Globle.index = 1;
                });
                Navigator.of(context).pushNamed("Slider_Page");
              },
              child: Container(
                height: _height * 0.35,
                width: _width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("${Globle.architecture[0]}"),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Architecture",
                  style: GoogleFonts.carterOne(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.2,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Globle.index = 2;
                });
                Navigator.of(context).pushNamed("Slider_Page");
              },
              child: Container(
                height: _height * 0.25,
                width: _width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("${Globle.animal[0]}"),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Animal",
                  style: GoogleFonts.carterOne(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.2,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Globle.index = 3;
                });
                Navigator.of(context).pushNamed("Slider_Page");
              },
              child: Container(
                height: _height * 0.35,
                width: _width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("${Globle.people[0]}"),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "People",
                  style: GoogleFonts.carterOne(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.2,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Globle.index = 4;
                });
                Navigator.of(context).pushNamed("Slider_Page");
              },
              child: Container(
                height: _height * 0.33,
                width: _width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("${Globle.renders_3d[0]}"),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "3D Render",
                  style: GoogleFonts.carterOne(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.2,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.5),
    );
  }
}
