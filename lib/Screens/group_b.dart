import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pro/game/itemmodel.dart';
import 'package:pro/game/play.dart';
import 'package:pro/variables.dart';

class Group1 extends StatefulWidget {
  Group1({super.key});

  @override
  State<Group1> createState() => _Group1State();
}

class _Group1State extends State<Group1> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  AudioPlayer audioPlayer = AudioPlayer();

  late AudioCache audioCache;
  List<ItemModel> food = [
    ItemModel(name: 'شباك', value: 'شباك', img:  'assets/B/a0.jpeg',id: 0),
    ItemModel(name: 'باب', value: 'باب', img: 'assets/B/a1.jpeg',id: 1),
    ItemModel(name: 'ضوء', value: 'ضوء', img: 'assets/B/a2.jpeg',id: 2),
    ItemModel(name: 'دفايه', value: 'دفايه', img: 'assets/B/a3.jpeg',id: 3),
    ItemModel(name: 'مغسلة', value: 'مغسلة', img:'assets/B/a4.jpeg',id: 4),
    ItemModel(name: 'حرام', value: 'حرام', img: 'assets/B/a5.jpeg',id: 5),
    ItemModel(name: 'مراية', value: 'مراية', img: 'assets/B/a6.jpeg',id: 6),
    ItemModel(name: 'فرشة', value: 'فرشة', img: 'assets/B/a7.jpeg',id: 7),
    ItemModel(name: 'خزانة', value: 'خزانة', img: 'assets/B/a8.jpeg',id: 8),
    ItemModel(name: 'مخدة', value: 'مخدة', img:'assets/B/a9.jpeg',id: 9),
    ItemModel(name: 'كرسي', value: 'كرسي', img: 'assets/B/a10.jpeg',id: 10),
    ItemModel(name: 'كرفان', value: 'كرفان', img: 'assets/B/a11.jpeg',id: 11),
    ItemModel(name: 'طاولة', value: 'طاولة', img: 'assets/B/a12.jpeg',id: 12),
    ItemModel(name: 'مطبخ', value: 'مطبخ', img: 'assets/B/a13.jpeg',id: 13),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    globele;
    food;
    audioPlayer;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      persistentFooterAlignment: AlignmentDirectional.bottomStart,
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return group[--globele];
                  }),
                );
              },
              child: Text(
                'السابق',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context){
                        return GamePlayer(food); }
                  ),
                );},
              child: Text('الأختبار',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

            ),
            MaterialButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return group[++globele];
                  }),
                );
              },
              child: Text(
                'التالي',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),

            ),
          ],
        ),
      ],
      appBar: AppBar(
        title:  Text(
          'أدوات المنزل',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState?.showBottomSheet(
                (context) => Container(
                  width: double.infinity,
                  padding:  EdgeInsetsDirectional.all(2.r),
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
            icon:  Icon(
              Icons.star,
              size: 30.r,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverPadding(
            padding:  EdgeInsetsDirectional.all(2.r),
            sliver: SliverGrid.count(
              crossAxisSpacing: 5.h,
              mainAxisSpacing: 5.h,
              crossAxisCount: 3,
              childAspectRatio: 0.6.h,
              children: List.generate(food.length, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: GestureDetector(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(30.r),
                              color: Colors.blue,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Image(
                                    image: AssetImage(
                                      food[index].img,
                                    ),
                                    width: double.maxFinite,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                 SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  food[index].name,
                                  style: pageFont,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            scaffoldKey.currentState?.showBottomSheet(
                              (context) => Container(
                                  width: double.infinity,
                                  padding:  EdgeInsetsDirectional.all(2.r),
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
                                                      .circular(30.r)),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image(
                                            image: AssetImage(
                                              food[index].img,
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
                                        food[index].name,
                                        style: bottomSheetFont,
                                      ),
                                    ],
                                  )),
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
              }),
            ),
          ),
        ],
      ),

    );
  }

  void playMusic(int s) async {
    // await audioPlayer.play(UrlSource(musicUrl)) ;
    await audioPlayer.play(AssetSource('B/a$s.mp3'));
  }

  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
