import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pro/game/itemmodel.dart';
import 'package:pro/game/play.dart';
import 'package:pro/variables.dart';

class Group4 extends StatefulWidget {
  const Group4({super.key});

  @override
  State<Group4> createState() => _Group4State();
}

class _Group4State extends State<Group4> {
  var scaffolidKey=GlobalKey<ScaffoldState>();
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  List<ItemModel> food = [
    ItemModel(name: 'تمر', value: 'تمر', img:  'assets/E/a0.jpeg'),
    ItemModel(name: 'رمان', value: 'رمان', img: 'assets/E/a1.jpeg'),
    ItemModel(name: 'بطيخ', value: 'بطيخ', img: 'assets/E/a2.jpeg'),
    ItemModel(name: 'تفاح', value: 'تفاح', img: 'assets/E/a3.jpeg'),
    ItemModel(name: 'فريز', value: 'فريز', img:'assets/E/a4.jpeg'),
    ItemModel(name: 'عنب', value: 'عنب', img: 'assets/E/a5.jpeg'),
    ItemModel(name: 'برتقال', value: 'برتقال', img: 'assets/E/a6.jpeg'),
    ItemModel(name: 'موز', value: 'موز', img: 'assets/E/a7.jpeg'),
  ];

  @override
  void initState() {
    super.initState();
isIcon;
    /// Compulsory
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolidKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      appBar: AppBar(
        title: Text(
          'الفواكة',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              scaffolidKey.currentState?.showBottomSheet(
                    (context) => Container(
                  width: double.infinity,
                  padding:  EdgeInsetsDirectional.all(2.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Lottie.asset('assets/anim.json',),),
                      Expanded(
                        child: Lottie.asset('assets/anim.json',),),
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
                                  (context) =>Container(
                                  width: double.infinity,
                                  padding:EdgeInsetsDirectional.all(2.r),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                          if(isIcon==true){
                                            playMusic(index);
                                          }
                                          else{
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
                            if(isIcon==true){
                              playMusic(index);
                            }
                            else{
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context){
                  return GamePlayer(food); }
            ),
          );},
        child: Text('الأختبار',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
        isExtended: true,

      ),
    );
  }

  void playMusic(int s) async {
    // await audioPlayer.play(UrlSource(musicUrl)) ;
    await audioPlayer.play(AssetSource('E/a$s.mp3'));
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
