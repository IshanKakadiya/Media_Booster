// ignore_for_file: camel_case_types, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallary_image_app/Globle.dart';

class Slider_Page extends StatefulWidget {
  const Slider_Page({Key? key}) : super(key: key);

  @override
  State<Slider_Page> createState() => _Slider_PageState();
}

class _Slider_PageState extends State<Slider_Page> {
  CarouselController carouselController = CarouselController();
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("${Globle.dynamicUI[Globle.index]["name"]} Slider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                autoPlayCurve: Curves.easeInOut,
                autoPlayInterval: const Duration(seconds: 3),
                scrollPhysics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                height: 300,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                initialPage: currentindex,
                onPageChanged: (val, _) {
                  setState(() {
                    currentindex = val;
                  });
                }),
            items: Globle.imageAddList
                .map(
                  (e) => Container(
                    width: _width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("${e["path"]}"),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Globle.imageAddList.map((e) {
              int i = Globle.imageAddList.indexOf(e);

              return Row(
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: (currentindex == i)
                          ? Colors.white
                          : Colors.white.withOpacity(0.2),
                    ),
                    onTap: () {
                      carouselController.animateToPage(i);
                      setState(() {
                        currentindex = i;
                      });
                    },
                  ),
                  const SizedBox(width: 7),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
