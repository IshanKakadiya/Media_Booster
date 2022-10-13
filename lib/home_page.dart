// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videos_catagory_app/Globle.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  forVideoCategory() {
    Globle.videoOnes = [];

    for (int i = 0; i < Globle.videoList.length; i++) {
      if (Globle.videoList[i]["category"] ==
          Globle.videoCatagory[Globle.index]["category"]) {
        Globle.videoOnes.add(Globle.videoList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: Globle.videoCatagory.length,
        separatorBuilder: (context, i) => const SizedBox(height: 15),
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            setState(() {
              Globle.index = i;
              forVideoCategory();
            });
            Navigator.of(context).pushNamed("/");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            height: 200,
            // color: Colors.black,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("${Globle.videoCatagory[i]["images"]}"),
              ),
            ),
            child: Text(
              "${Globle.videoCatagory[i]["category"]}",
              style: GoogleFonts.carterOne(
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 1.2,
                fontSize: 50,
                shadows: [
                  const Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Colors.black),
                  const Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Colors.black),
                  const Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Colors.black),
                  const Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
