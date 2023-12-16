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
  String? group;
  late List<ItemModel> node = this.widget.items;
  late List<ItemModel> items2 = this.widget.items;
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  late double result;
  late double medium;

  String? number() {
    String b = items2.first.name;
    switch (b) {
      case 'سكين':
        {
          group = 'A';
        }
        break;
      case 'شباك':
        {
          group = 'B';
        }
        break;
      case 'حصان':
        {
          group = 'C';
        }
        break;
      case 'بصل':
        {
          group = 'D';
        }
        break;
      case 'تمر':
        {
          group = 'E';
        }
        break;
      case 'لفة':
        {
          group = 'F';
        }
        break;
      case 'شاي':
        {
          group = 'G';
        }
        break;
      case 'قميص':
        {
          group = 'H';
        }
        break;
      case 'الشرطة':
        {
          group = 'I';
        }
        break;
      case 'عطر':
        {
          group = 'J';
        }
        break;
    }
    return group;
  }

  initGame() {
    score = 0;
    gameOver = false;
    node = List<ItemModel>.from(this.widget.items);
    items2 = List<ItemModel>.from(this.widget.items);
    items2.shuffle();
    node.shuffle();
    medium = (items2.length / 2);
    result = medium * 5;
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    number();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (node.length == 0) gameOver = true;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }),
            );
          },
          icon: Icon(Icons.home),
        ),
        title: Text('الأختبار'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.all(10.r),
              ),
              if (!gameOver)
                Row(
                  children: [
                    Spacer(),
                    Column(
                      children: node.map(
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
                                backgroundImage: AssetImage(
                                  item.img,
                                ),
                                radius: 35.r,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(item.img),
                                radius: 35.r,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receviedItem) {
                            if (item.value == receviedItem.value) {
                              int i;
                              setState(() {
                                i = item.id;
                                audioPlayer
                                    .release()
                                    .then((value) => playMusic(i));
                              });

                              setState(() {
                                node.remove(receviedItem);
                                items2.remove(item);
                              });
                              score += 5;
                              item.accepting = false;
                            } else {
                              audioPlayer.release().then((value) async {
                                await audioPlayer.play(AssetSource('t0.mp3'));
                              });

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
                              Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                backgroundImage: AssetImage(item.img),
                                radius: 35.r,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
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
                        child: Text(
                          score >= result
                              ? 'تم أجتياز الاختبار بنجاح'
                              : 'لم يتم اجتياز الأختبار '
                                  'يرجى المحاولة مرة أخرى',
                          style: score >= result
                              ? Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.green,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  )
                              : Theme.of(context)
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
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
    await audioPlayer.play(AssetSource('$group/a$s.mp3'));
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }
}
