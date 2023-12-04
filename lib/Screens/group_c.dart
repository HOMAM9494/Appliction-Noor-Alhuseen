import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pro/game/itemmodel.dart';
import 'package:pro/game/play.dart';
import 'package:pro/variables.dart';

class Group2 extends StatefulWidget {
  const Group2({super.key});

  @override
  State<Group2> createState() => _Group2State();
}

class _Group2State extends State<Group2> {
  var scaffolidKey=GlobalKey<ScaffoldState>();
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  List<ItemModel> food = [
    ItemModel(name: 'حصان', value: 'حصان', img:  'assets/C/a0.jpeg'),
    ItemModel(name: 'دجاجة', value: 'دجاجة', img: 'assets/C/a1.jpeg'),
    ItemModel(name: 'كلب', value: 'كلب', img: 'assets/C/a2.jpeg'),
    ItemModel(name: 'بقرة', value: 'بقرة', img: 'assets/C/a3.jpeg'),
    ItemModel(name: 'بسه', value: 'بسه', img:'assets/C/a4.jpeg'),
    ItemModel(name: 'حمامة', value: 'حمامة', img: 'assets/C/a5.jpeg'),
    ItemModel(name: 'عصفور', value: 'عصفور', img: 'assets/C/a6.jpeg'),
    ItemModel(name: 'أرنب', value: 'أرنب', img: 'assets/C/a7.jpeg'),
    ItemModel(name: 'خروف', value: 'خروف', img: 'assets/C/a8.jpeg'),
    ItemModel(name: 'حمار', value: 'حمار', img: 'assets/C/a9.jpeg'),

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
        title: Text('الحيوانات',style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold),),
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
                        child: Lottie.asset('assets/anim.json',),),
                      Expanded(
                        child: Lottie.asset('assets/anim.json',),),
                    ],
                  ),
                ),
              );
            },
            icon:  Icon(
              Icons.star,
              size: 30.r,
            ),
          ),],
      ),
      body: CustomScrollView(

        primary: true,
        slivers: <Widget>[
          SliverPadding(
            padding:EdgeInsetsDirectional.all(2.r),
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
                              borderRadius: BorderRadiusDirectional.circular(25.r),
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
                                  padding: EdgeInsetsDirectional.all(2.r),
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
                                        style:bottomSheetFont,
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
    await audioPlayer.play(AssetSource('C/a$s.mp3'));
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
