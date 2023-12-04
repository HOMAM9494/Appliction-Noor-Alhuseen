import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pro/game/itemmodel.dart';
import 'package:pro/game/play.dart';
import 'package:pro/variables.dart';

class GroupGame extends StatefulWidget {
  GroupGame({super.key});

  @override
  State<GroupGame> createState() => _GroupGameState();
}

class _GroupGameState extends State<GroupGame> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  AudioPlayer audioPlayer = AudioPlayer();

  late AudioCache audioCache;

  List<String> food = [
    'سكين',
    "إبريق",
    "فنجان",
    "كأس",
    "ملعقة",
    "صحن",
    "طنجرة",
    "شوكة"
  ];
  List<ItemModel> items = [
  ItemModel(name: 'سكين', value: 'سكين', img:  'assets/A/a0.jpg'),
  ItemModel(name: 'إبريق', value: 'إبريق', img: 'assets/A/a1.jpg'),
  ItemModel(name: 'فنجان', value: 'فنجان', img: 'assets/A/a2.jpg'),
  ItemModel(name: 'كأس', value: 'كأس', img: 'assets/A/a3.jpg'),
  ItemModel(name: 'ملعقة', value: 'ملعقة', img:'assets/A/a4.jpg'),
  ItemModel(name: 'صحن', value: 'صحن', img: 'assets/A/a5.jpg'),
  ItemModel(name: 'طنجرة', value: 'طنجرة', img: 'assets/A/a6.jpg'),
  ItemModel(name: 'شوكة', value: 'شوكة', img: 'assets/A/a7.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'أدوات الطعام',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState?.showBottomSheet(
                (context) => Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.all(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Lottie.asset(
                          'assets/anim.json',
                        ),
                      ),
                      Expanded(
                        child: Lottie.asset(
                          'assets/anim.json',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.star,
              size: 30,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsetsDirectional.all(2),
            sliver: SliverGrid.count(
              crossAxisSpacing: 5.h,
              mainAxisSpacing: 5.h,
              crossAxisCount: 3,
              childAspectRatio: 0.6.h,
              children: List.generate(
                items.length,
                (index) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: GestureDetector(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(25.r),
                                color: Colors.blue,
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Image(
                                      image: AssetImage(
                                           items[index].img,
                                      ),
                                      width: double.maxFinite,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                   " ${items[index].name}",
                                    style: pageFont,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              scaffoldKey.currentState?.showBottomSheet(
                                (context) => Container(
                                  width: double.infinity,
                                  padding: const EdgeInsetsDirectional.all(2),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(30.r),
                                            color: Colors.green,
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image(
                                            image: AssetImage(
                                              items[index].img,
                                            ),
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: 400.h,
                                          ),
                                        ),
                                        onTap: () {
                                          if (isIcon == true) {
                                            playMusic(index);
                                          } else {
                                            dispose();
                                          }
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              audioPlayer.release();
                                            },
                                            icon: Icon(
                                              Icons.stop_circle_rounded,
                                              size: 75.r,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              if (isIcon == true) {
                                                playMusic(index);
                                              } else {
                                                dispose();
                                              }
                                            },
                                            icon: Icon(
                                              Icons.not_started,
                                              size: 75.r,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        food[index],
                                        style: bottomSheetFont,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              if (isIcon == true) {
                                playMusic(index);
                              } else {
                                dispose();
                              }
                            }),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context){
              return GamePlayer(items); }
          ),
        );},
        child: Text('الأختبار',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
        isExtended: true,

      ),
    );
  }

  void playMusic(int s) async {
    // await audioPlayer.play(UrlSource(musicUrl)) ;
    await audioPlayer.play(AssetSource('A/a$s.mp3'));
  }

  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
