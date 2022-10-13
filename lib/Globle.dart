// ignore_for_file: file_names

import 'package:video_player/video_player.dart';

class Globle {
  static List<Map> videoList = [
    {
      "Name": "Bee",
      "path":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "category": "Animal",
    },
    {
      "Name": "Big_Buck_Bunny",
      "path":
          "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
      "category": "Animal",
    },
    {
      "Name": "Small-flowering-plants-in-a-nursery",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-small-flowering-plants-in-a-nursery-43709-large.mp4",
      "category": "Flower",
    },
    {
      "Name": "Going-down-a-curved-highway-through-a-mountain-range",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-through-a-mountain-range-41576-large.mp4",
      "category": "Travel",
    },
    {
      "Name": "Stars-in-space",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-stars-in-space-background-1610-large.mp4",
      "category": "Travel",
    },
    {
      "Name": "Stunning-sunset-seen-from-the-sea",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-stunning-sunset-seen-from-the-sea-4119-large.mp4",
      "category": "Travel",
    },
    {
      "Name": "People-pouring-a-warm-drink-around-a-campfire",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-people-pouring-a-warm-drink-around-a-campfire-513-large.mp4",
      "category": "Travel",
    },
    {
      "Name": "Portrait-of-a-jugglery-woman-making-a-fire-hoop",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-jugglery-woman-making-a-fire-hoop-43681-large.mp4",
      "category": "Fun",
    },
    {
      "Name": "Hands-of-a-man-playing-on-a-computer",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-hands-of-a-man-playing-on-a-computer-43527-large.mp4",
      "category": "Fun",
    },
    {
      "Name": "Hands-of-a-skilled-musician-playing-the-piano",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-hands-of-a-skilled-musician-playing-the-piano-43776-large.mp4",
      "category": "Fun",
    },
    {
      "Name": "Fireworks-illuminating-the-beach-sky",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-fireworks-illuminating-the-beach-sky-4157-large.mp4",
      "category": "Travel",
    },
  ];

  static List<VideoPlayerController> imageVideo = [];

  static List videoCatagory = [
    {"category": "Animal", "images": "image/14.jpg"},
    {"category": "Flower", "images": "image/13.jpg"},
    {"category": "Travel", "images": "image/12.jpg"},
    {"category": "Fun", "images": "image/11.jpg"},
  ];

  static int index = 0;

  static List videoOnes = [];
}
