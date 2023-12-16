import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pro/game/itemmodel.dart';
import 'package:pro/game/play.dart';
import 'package:pro/homescreen.dart';
import 'package:pro/variables.dart';

class Group0 extends StatefulWidget {
  late List<ItemModel> food;
  Group0(List<ItemModel> l) {
    this.food = l;
  }
  @override
  State<Group0> createState() => _Group0State();
}
class _Group0State extends State<Group0> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  List<ItemModel> food = [
    ItemModel(name: 'سكين', value: 'سكين', img: 'assets/A/a0.jpg', id: 0),
    ItemModel(name: 'إبريق', value: 'إبريق', img: 'assets/A/a1.jpg', id: 1),
    ItemModel(name: 'فنجان', value: 'فنجان', img: 'assets/A/a2.jpg', id: 2),
    ItemModel(name: 'كأس', value: 'كأس', img: 'assets/A/a3.jpg', id: 3),
    ItemModel(name: 'ملعقة', value: 'ملعقة', img: 'assets/A/a4.jpg', id: 4),
    ItemModel(name: 'صحن', value: 'صحن', img: 'assets/A/a5.jpg', id: 5),
    ItemModel(name: 'طنجرة', value: 'طنجرة', img: 'assets/A/a6.jpg', id: 6),
    ItemModel(name: 'شوكة', value: 'شوكة', img: 'assets/A/a7.jpg', id: 7),
  ];
  String? auduo;
  String? number() {
    String b =this.widget.food.first.name ;
    switch (b) {
      case 'سكين':
        {
          auduo = 'A';
        }
        break;
      case 'شباك':
        {
          auduo = 'B';
        }
        break;
      case 'حصان':
        {
          auduo = 'C';
        }
        break;
      case 'بصل':
        {
          auduo = 'D';
        }
        break;
      case 'تمر':
        {
          auduo = 'E';
        }
        break;
      case 'لفة':
        {
          auduo = 'F';
        }
        break;
      case 'شاي':
        {
          auduo = 'G';
        }
        break;
      case 'قميص':
        {
          auduo = 'H';
        }
        break;
      case 'الشرطة':
        {
          auduo = 'I';
        }
        break;
      case 'عطر':
        {
          auduo = 'J';
        }
        break;
    }
    return auduo;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.food;
    audioPlayer;
    number();
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
                if (globele==0){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }),
                  );
                }
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
                        return GamePlayer(this.widget.food); }
                  ),
                );},
              child: Text('الأختبار',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

            ),
            MaterialButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                globele=++globele;
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return group[globele];
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
              children: List.generate(this.widget.food.length, (index) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image(
                                    image: AssetImage(
                                      this.widget.food[index].img,
                                    ),
                                    width: double.maxFinite,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  this.widget.food[index].name,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  30.r),
                                          color: Colors.green,
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image(
                                          image: AssetImage(
                                            this.widget.food[index].img,
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
                                      this.widget.food[index].name,
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
              }),
            ),
          ),
        ],
      ),
    );
  }

  void playMusic(int s) async {
    // await audioPlayer.play(UrlSource(musicUrl)) ;
    await audioPlayer.play(AssetSource('$auduo/a$s.mp3'));
  }

  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
