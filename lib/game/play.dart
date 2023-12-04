import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/homescreen.dart';
import 'itemmodel.dart';
import 'package:audioplayers/audioplayers.dart';

// ignore: must_be_immutable
class GamePlayer extends StatefulWidget {
  late List<ItemModel> items;

  GamePlayer(List<ItemModel> l) {
    this.items = l;
  }

  @override
  State<GamePlayer> createState() => _GamePlayerState();
}

class _GamePlayerState extends State<GamePlayer> {
  late int score;
  late bool gameOver;
  late List<ItemModel> items2 = this.widget.items;
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  late int items;
  late double result;
  late double medium;


  initGame() {
    score = 0;
    gameOver = false;
    items2 = List<ItemModel>.from(this.widget.items);
    items2.shuffle();
    this.widget.items.shuffle();
    items = items2.length;
    medium = (items2.length / 2);
    result=medium * 5;
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.items.length == 0) gameOver = true;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.all(15.r),
              ),
              if (!gameOver)
                Row(
                  children: [
                    Spacer(),
                    Column(
                      children: this.widget.items.map(
                        (item) {
                          return Container(
                            margin: EdgeInsetsDirectional.all(8.r),
                            child: Draggable<ItemModel>(
                              data: item,
                              feedback: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(item.img),
                                radius: 30.r,
                              ),
                              childWhenDragging: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(item.img),
                                radius: 40.r,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(item.img),
                                radius: 30.r,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receviedItem) {
                            if (item.value == receviedItem.value) {
                              audioPlayer
                                  .release()
                                  .then((value) => playMusic(1));
                              setState(() {
                                this.widget.items.remove(receviedItem);
                                items2.remove(item);
                              });
                              score += 5;
                              item.accepting = false;
                            } else {
                              audioPlayer
                                  .release()
                                  .then((value) => playMusic(0));

                              setState(() {
                                score -= 5;
                                item.accepting = false;
                              });
                            }
                          },
                          onWillAccept: (receviedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          onLeave: (receviedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          builder: (context, receviedItem, rejectItem) =>
                              Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: item.accepting
                                  ? Colors.grey[400]
                                  : Colors.grey[200],
                            ),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.width / 6,
                            width: MediaQuery.of(context).size.width / 3,
                            margin: EdgeInsetsDirectional.all(8),
                            child: Text(
                              item.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Spacer(),
                  ],
                ),
              if (gameOver)
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.all(5.r),
                        child: Text(
                          'نتيجة الطالب : ${score}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.red,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(8.r),
                        child: Text(
                          'نسبة النجاح : ${result}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.red,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(8.r),
                        child:Text(score>=result?
                          'تم أجتياز الاختبار بنجاح':'لم يتم اجتياز الأختبار '
                            'يرجى المحاولة مرة أخرى',
                          style:score>=result? Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                            color: Colors.green,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ):Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                            color: Colors.red,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.all(8.r),
                        child: Container(
                          height: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  }),
                                );
                              },
                              child: Text(
                                'الصفحة الرئيسية',
                                style:
                                    TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void playMusic(int s) async {
    // await audioPlayer.play(UrlSource(musicUrl)) ;
    await audioPlayer.play(AssetSource('t$s.mp3'));
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
