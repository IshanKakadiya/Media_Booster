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
  imageAdd() {
    Globle.imageAddList = [];

    for (int i = 0; i < Globle.allImageList.length; i++) {
      if (Globle.allImageList[i]["category"] ==
          Globle.dynamicUI[Globle.index]["name"]) {
        Globle.imageAddList.add(Globle.allImageList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          children: Globle.dynamicUI.map((e) {
            int i = Globle.dynamicUI.indexOf(e);

            return InkWell(
              onTap: () {
                setState(() {
                  Globle.index = i;
                  imageAdd();
                });
                Navigator.of(context).pushNamed("Slider_Page");
              },
              child: Container(
                height: Globle.dynamicUI[i]["height"],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("${Globle.dynamicUI[i]["path"]}"),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "${Globle.dynamicUI[i]["name"]}",
                  style: GoogleFonts.carterOne(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.2,
                    fontSize: Globle.dynamicUI[i]["fontsize"],
                    shadows: [
                      const Shadow(
                          // bottomLeft
                          offset: Offset(-0.5, -0.5),
                          color: Colors.black),
                      const Shadow(
                          // bottomRight
                          offset: Offset(0.5, -0.5),
                          color: Colors.black),
                      const Shadow(
                          // topRight
                          offset: Offset(0.5, 0.5),
                          color: Colors.black),
                      const Shadow(
                          // topLeft
                          offset: Offset(-0.5, 0.5),
                          color: Colors.black),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.5),
    );
  }
}
