// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, unused_local_variable

import 'package:audio_application/Globle.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const AudioPlayerPage(),
    ),
  );
}

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({Key? key}) : super(key: key);

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  String totalDuration = "0:00:00";
  bool error = false;
  bool playStop = false;
  int index = 0;
  bool oneTimeUse = true;
  bool playAll = false;

  @override
  void initState() {
    super.initState();

    songs(autoPlay: false);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    playStop = assetsAudioPlayer.isPlaying.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "MUSIC",
              style: TextStyle(
                fontSize: 35,
                color: Colors.red,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: _height * 0.69,
              // color: Colors.red,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: Globle.songs.length,
                separatorBuilder: (context, i) => const Divider(height: 0),
                itemBuilder: (context, i) => ListTile(
                  onTap: () async {
                    await assetsAudioPlayer.stop();
                    setState(() {
                      playStop = false;
                      index = i;
                      error = false;
                      songs(autoPlay: true);
                      // playList(autoPlay: true);
                      // assetsAudioPlayer.playlistPlayAtIndex(index);
                    });
                  },
                  textColor: (index == i) ? Colors.red : Colors.white,
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: 0),
                  contentPadding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0, bottom: 0),
                  title: Text(
                    "${Globle.songs[i]["Name"]}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text(
                    "Unknown - download",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.more_vert),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  bootomsheet();
                  playStop = assetsAudioPlayer.isPlaying.value;
                  totalDuration = assetsAudioPlayer
                      .current.value!.audio.duration
                      .toString()
                      .split(".")[0];
                });
              },
              shape:
                  const Border(top: BorderSide(color: Colors.grey, width: 1)),
              leading: const Icon(Icons.music_note),
              minLeadingWidth: 15,
              title: Text(
                "${Globle.songs[index]["Name"]}",
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: const Text("Unknown"),
              trailing: StreamBuilder(
                stream: assetsAudioPlayer.isPlaying,
                builder: (context, AsyncSnapshot snapshot) {
                  playStop = assetsAudioPlayer.isPlaying.value;

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon((playStop) ? Icons.pause : Icons.play_arrow),
                        onPressed: () async {
                          await assetsAudioPlayer.playOrPause();
                          setState(() {
                            error = false;
                            totalDuration = assetsAudioPlayer
                                .current.value!.audio.duration
                                .toString()
                                .split(".")[0];
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next_sharp),
                        onPressed: () async {
                          await assetsAudioPlayer.stop();
                          setState(() {
                            if (index < 8) {
                              assetsAudioPlayer.stop();
                              // playStop = true;
                              index++;
                              songs(autoPlay: true);
                            } else {
                              assetsAudioPlayer.stop();
                              index = 0;
                              songs(autoPlay: true);
                            }
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bootomsheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: ((context, setState) {
            return FractionallySizedBox(
              heightFactor: 0.95,
              child: Container(
                padding: const EdgeInsets.only(left: 25, right: 20, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: IconButton(
                        icon: const Icon(
                            Icons.keyboard_double_arrow_down_rounded),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Text(
                      "${Globle.songs[index]["Name"]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Unknown",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.5)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        height: 260,
                        width: 240,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.music_note_rounded,
                          size: 200,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    StreamBuilder(
                      stream: assetsAudioPlayer.currentPosition,
                      builder: (context, AsyncSnapshot snapshot) {
                        Duration data = assetsAudioPlayer.currentPosition.value;

                        if (playAll) {
                          if (assetsAudioPlayer.currentPosition.value
                                  .toString()
                                  .split(".")[0] ==
                              totalDuration) {
                            if (index < 8) {
                              assetsAudioPlayer.stop();
                              // playStop = true;
                              index++;
                              songs(autoPlay: true);
                            }
                          }
                        }

                        return Column(
                          children: [
                            Slider(
                              min: 0,
                              max: (assetsAudioPlayer.current.hasValue)
                                  ? assetsAudioPlayer
                                      .current.value!.audio.duration.inSeconds
                                      .toDouble()
                                  : 1,
                              value: (assetsAudioPlayer.current.hasValue)
                                  ? data.inSeconds.toDouble()
                                  : 0,
                              activeColor: Colors.white,
                              thumbColor: Colors.red,
                              inactiveColor: Colors.white.withOpacity(0.4),
                              onChanged: (val) {
                                assetsAudioPlayer
                                    .seek(Duration(seconds: val.toInt()));
                              },
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 17),
                                Text(
                                  data.toString().split(".")[0],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  totalDuration,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                const SizedBox(width: 17),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    StreamBuilder(
                        stream: assetsAudioPlayer.isPlaying,
                        builder: (context, AsyncSnapshot snapshot) {
                          playStop = assetsAudioPlayer.isPlaying.value;

                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // const Spacer(flex: 3),
                                  IconButton(
                                    icon: const Icon(Icons.skip_previous_sharp,
                                        size: 40),
                                    onPressed: () {
                                      setState(() {
                                        if (index > 0) {
                                          assetsAudioPlayer.stop();
                                          // playStop = true;
                                          index--;
                                          songs(autoPlay: true);
                                        } else {
                                          assetsAudioPlayer.stop();
                                          index = 8;
                                          songs(autoPlay: true);
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      (playStop)
                                          ? Icons.pause_circle_filled_sharp
                                          : Icons.play_circle_fill_sharp,
                                      size: 50,
                                    ),
                                    onPressed: () async {
                                      await assetsAudioPlayer.playOrPause();
                                      setState(() {
                                        // playStop = assetsAudioPlayer.isPlaying.value;
                                        playAll = false;
                                        error = false;
                                        totalDuration = assetsAudioPlayer
                                            .current.value!.audio.duration
                                            .toString()
                                            .split(".")[0];
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.skip_next_sharp,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (index < 8) {
                                          assetsAudioPlayer.stop();
                                          // playStop = true;
                                          index++;
                                          songs(autoPlay: true);
                                        } else {
                                          assetsAudioPlayer.stop();
                                          index = 0;
                                          songs(autoPlay: true);
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  songs({required bool autoPlay}) {
    assetsAudioPlayer.open(
      Audio(
        "assets/audio/${Globle.songs[index]["path"]}",
        metas: Metas(
          title: "${Globle.songs[index]["Name"]}",
          artist: "Unknown",
          image: const MetasImage.asset(
            "assets/images/songs.png",
          ),
        ),
      ),
      showNotification: true,
      autoStart: autoPlay,
      headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
    );
  }
}
