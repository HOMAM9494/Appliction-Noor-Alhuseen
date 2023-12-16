import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pro/game/itemmodel.dart';
import 'package:pro/game/play.dart';
import 'package:pro/variables.dart';

class Group3 extends StatefulWidget {
  const Group3({super.key});

  @override
  State<Group3> createState() => _Group3State();
}

class _Group3State extends State<Group3> {
  var scaffolidKey = GlobalKey<ScaffoldState>();
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;

  List<ItemModel> food = [
    ItemModel(name: 'بصل', value: 'بصل', img:  'assets/D/a0.jpeg',id: 0),
    ItemModel(name: 'عرانيس', value: 'عرانيس', img: 'assets/D/a1.jpeg',id: 1),
    ItemModel(name: 'خس', value: 'خس', img: 'assets/D/a2.jpeg',id: 2),
    ItemModel(name: 'بقدونس', value: 'بقدونس', img: 'assets/D/a3.jpeg',id: 3),
    ItemModel(name: 'جزر', value: 'جزر', img:'assets/D/a4.jpeg',id: 4),
    ItemModel(name: 'ثوم', value: 'ثوم', img: 'assets/D/a5.jpeg',id: 5),
    ItemModel(name: 'فليفلة', value: 'فليفلة', img: 'assets/D/a6.jpeg',id: 6),
    ItemModel(name: 'بطاطا', value: 'بطاطا', img: 'assets/D/a7.jpeg',id: 7),
    ItemModel(name: 'بيتنجان', value: 'بيتنجان', img: 'assets/D/a8.jpeg',id: 8),
    ItemModel(name: 'بندورة', value: 'بندورة', img:'assets/D/a9.jpeg',id: 9),
    ItemModel(name: 'خيار', value: 'خيار', img: 'assets/D/a10.jpeg',id: 10),
    ItemModel(name: 'ليمون', value: 'ليمون', img: 'assets/D/a11.jpeg',id: 11),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    food;
    audioPlayer;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolidKey,
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
        title: Text(
          'الخضراوات',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              scaffolidKey.currentState?.showBottomSheet(
                (context) => Container(
                  width: double.infinity,
                  padding: EdgeInsetsDirectional.all(2.r),
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
            icon: Icon(
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
            padding: EdgeInsetsDirectional.all(2.r),
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
                                  BorderRadiusDirectional.circular(25.r),
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
                            scaffolidKey.currentState?.showBottomSheet(
                              (context) => Container(
                                  width: double.infinity,
                                  padding: EdgeInsetsDirectional.all(2.r),
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
    await audioPlayer.play(AssetSource('D/a$s.mp3'));
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
