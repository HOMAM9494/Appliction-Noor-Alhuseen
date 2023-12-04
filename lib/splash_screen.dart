import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pro/homescreen.dart';
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  @override
   initState(){
    super.initState();
    audioPlayer.release();
     audioPlayer.play(AssetSource('audio1.mp3'));
       Timer(Duration(seconds: 25),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context){
                  audioPlayer.release();
                  return HomeScreen();
            }
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تنويه هام جداً',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFFFFFFF),Color(0xFFFFFFFF),]
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        'ماما العزيزة'
                            ' \nالأجهزة الذكية مهمة في حياتنا العملية وممكن أن تساعدنا بعملية التعليم ولكن ننصح بعدم أطالة الوقت عليها لأن لها مضار كثيره '
                            '\nمن المفيد جدا بعد الأنتهاء من التطبيق تعميم الفكرة في بيئتكم الجميلة',
                        style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    LottieBuilder.asset(
                      'assets/anim5.json',
                      height: 225.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          height: 25.h,
                          onPressed: () {
                            audioPlayer.release();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          child: Text(
                            "الصفحة الرئيسية ",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'تم تصميم البرنامج بالتعاون بين ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/blumont.png'),
                          height: 75.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: Image(
                          image: AssetImage('assets/unnamed.jpg'),
                          height: 75.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
