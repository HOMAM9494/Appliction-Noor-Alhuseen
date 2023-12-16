import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/game/group_a.dart';
import 'package:pro/game/itemmodel.dart';
import 'package:pro/variables.dart';

import 'Screens/group_a.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> foodGro = [
    "أدوات الطعام",
    "أدوات المنزل",
    "الحيوانات",
    "الخضراوات",
    "الفواكة",
    "المأكولات",
    "المشروبات",
    "الملابس",
    "المواصلات",
    "العناية بالذات",
  ];
 IconData icon = Icons.volume_up;
    @override
  void initState() {
    super.initState();
    isIcon = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 135,
        leading: Container(
          child: Row(
            children: [
              Image(
                image: AssetImage("assets/unnamed.jpg"),
                height: 40.w,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isIcon = !isIcon;
                    });
                  },
                  icon: isIcon
                      ? Icon(
                          Icons.volume_up,
                          size: 30.w,
                        )
                      : Icon(
                          Icons.volume_off,
                          size: 30.w,
                        )),
            ],
          ),
        ),
        title: Text(
          'المجموعات',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          Image(
            image: AssetImage("assets/download.png"),
            width: 75.w,
          ),
        ],
      ),
      body: Container(
        color: Colors.black.withOpacity(0.5),
        child: CustomScrollView(
          clipBehavior: Clip.hardEdge,
          scrollDirection: Axis.horizontal,
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsetsDirectional.all(2.r),
              sliver: SliverGrid.count(
                crossAxisSpacing: 5.h,
                mainAxisSpacing: 5.h,
                crossAxisCount: 2,
                //1
                childAspectRatio: 1.7.w,
                //1.7
                children: List.generate(
                  foodGro.length,
                  (index) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(25.r),
                                color: Colors.lightBlue,
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
                                        'assets/Group/g$index.png',
                                      ),
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    foodGro[index],
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(//GroupGame
                                   //   builder: (context) => Group0(pageNumber['$index'] as List<ItemModel>)));
                                      builder: (context) => GroupGame(pageNumber[index] as List<ItemModel>,index)));
                             },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
