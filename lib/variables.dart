import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/game/itemmodel.dart';
import 'Screens/group_J.dart';
import 'Screens/group_a.dart';
import 'Screens/group_b.dart';
import 'Screens/group_c.dart';
import 'Screens/group_d.dart';
import 'Screens/group_e.dart';
import 'Screens/group_f.dart';
import 'Screens/group_g.dart';
import 'Screens/group_h.dart';
import 'Screens/group_i.dart';

bool isIcon = true;
TextStyle pageFont = TextStyle(
    fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white);
TextStyle bottomSheetFont = TextStyle(
  fontSize: 36.sp,
  fontWeight: FontWeight.w900,
);
List group = [
  Group0(food0),
  Group1(),
  Group2(),
  Group3(),
  Group4(),
  Group5(),
  Group6(),
  Group7(),
  Group8(),
  Group9(),
];

late int globele;
Map<int, List<ItemModel>> pageNumber = {
  0: food0,
  1: food1,
  2: food2,
  3: food3,
  4: food4,
  5: food5,
  6: food6,
  7: food7,
  8: food8,
  9: food9,
};

List<ItemModel> food0 = [
  ItemModel(name: 'سكين', value: 'سكين', img: 'assets/A/a0.jpg', id: 0),
  ItemModel(name: 'إبريق', value: 'إبريق', img: 'assets/A/a1.jpg', id: 1),
  ItemModel(name: 'فنجان', value: 'فنجان', img: 'assets/A/a2.jpg', id: 2),
  ItemModel(name: 'كأس', value: 'كأس', img: 'assets/A/a3.jpg', id: 3),
  ItemModel(name: 'ملعقة', value: 'ملعقة', img: 'assets/A/a4.jpg', id: 4),
  ItemModel(name: 'صحن', value: 'صحن', img: 'assets/A/a5.jpg', id: 5),
  ItemModel(name: 'طنجرة', value: 'طنجرة', img: 'assets/A/a6.jpg', id: 6),
  ItemModel(name: 'شوكة', value: 'شوكة', img: 'assets/A/a7.jpg', id: 7),
];
List<ItemModel> food1 = [
  ItemModel(name: 'شباك', value: 'شباك', img: 'assets/B/a0.jpeg', id: 0),
  ItemModel(name: 'باب', value: 'باب', img: 'assets/B/a1.jpeg', id: 1),
  ItemModel(name: 'ضوء', value: 'ضوء', img: 'assets/B/a2.jpeg', id: 2),
  ItemModel(name: 'دفايه', value: 'دفايه', img: 'assets/B/a3.jpeg', id: 3),
  ItemModel(name: 'مغسلة', value: 'مغسلة', img: 'assets/B/a4.jpeg', id: 4),
  ItemModel(name: 'حرام', value: 'حرام', img: 'assets/B/a5.jpeg', id: 5),
  ItemModel(name: 'مراية', value: 'مراية', img: 'assets/B/a6.jpeg', id: 6),
  ItemModel(name: 'فرشة', value: 'فرشة', img: 'assets/B/a7.jpeg', id: 7),
  ItemModel(name: 'خزانة', value: 'خزانة', img: 'assets/B/a8.jpeg', id: 8),
  ItemModel(name: 'مخدة', value: 'مخدة', img: 'assets/B/a9.jpeg', id: 9),
  ItemModel(name: 'كرسي', value: 'كرسي', img: 'assets/B/a10.jpeg', id: 10),
  ItemModel(name: 'كرفان', value: 'كرفان', img: 'assets/B/a11.jpeg', id: 11),
  ItemModel(name: 'طاولة', value: 'طاولة', img: 'assets/B/a12.jpeg', id: 12),
  ItemModel(name: 'مطبخ', value: 'مطبخ', img: 'assets/B/a13.jpeg', id: 13),
];
List<ItemModel> food2 = [
  ItemModel(name: 'حصان', value: 'حصان', img: 'assets/C/a0.jpeg', id: 0),
  ItemModel(name: 'دجاجة', value: 'دجاجة', img: 'assets/C/a1.jpeg', id: 1),
  ItemModel(name: 'كلب', value: 'كلب', img: 'assets/C/a2.jpeg', id: 2),
  ItemModel(name: 'بقرة', value: 'بقرة', img: 'assets/C/a3.jpeg', id: 3),
  ItemModel(name: 'بسه', value: 'بسه', img: 'assets/C/a4.jpeg', id: 4),
  ItemModel(name: 'حمامة', value: 'حمامة', img: 'assets/C/a5.jpeg', id: 5),
  ItemModel(name: 'عصفور', value: 'عصفور', img: 'assets/C/a6.jpeg', id: 6),
  ItemModel(name: 'أرنب', value: 'أرنب', img: 'assets/C/a7.jpeg', id: 7),
  ItemModel(name: 'خروف', value: 'خروف', img: 'assets/C/a8.jpeg', id: 8),
  ItemModel(name: 'حمار', value: 'حمار', img: 'assets/C/a9.jpeg', id: 9),
];
List<ItemModel> food3 = [
  ItemModel(name: 'بصل', value: 'بصل', img: 'assets/D/a0.jpeg', id: 0),
  ItemModel(name: 'عرانيس', value: 'عرانيس', img: 'assets/D/a1.jpeg', id: 1),
  ItemModel(name: 'خس', value: 'خس', img: 'assets/D/a2.jpeg', id: 2),
  ItemModel(name: 'بقدونس', value: 'بقدونس', img: 'assets/D/a3.jpeg', id: 3),
  ItemModel(name: 'جزر', value: 'جزر', img: 'assets/D/a4.jpeg', id: 4),
  ItemModel(name: 'ثوم', value: 'ثوم', img: 'assets/D/a5.jpeg', id: 5),
  ItemModel(name: 'فليفلة', value: 'فليفلة', img: 'assets/D/a6.jpeg', id: 6),
  ItemModel(name: 'بطاطا', value: 'بطاطا', img: 'assets/D/a7.jpeg', id: 7),
  ItemModel(name: 'بيتنجان', value: 'بيتنجان', img: 'assets/D/a8.jpeg', id: 8),
  ItemModel(name: 'بندورة', value: 'بندورة', img: 'assets/D/a9.jpeg', id: 9),
  ItemModel(name: 'خيار', value: 'خيار', img: 'assets/D/a10.jpeg', id: 10),
  ItemModel(name: 'ليمون', value: 'ليمون', img: 'assets/D/a11.jpeg', id: 11),
];
List<ItemModel> food4 = [
  ItemModel(name: 'تمر', value: 'تمر', img: 'assets/E/a0.jpeg', id: 0),
  ItemModel(name: 'رمان', value: 'رمان', img: 'assets/E/a1.jpeg', id: 1),
  ItemModel(name: 'بطيخ', value: 'بطيخ', img: 'assets/E/a2.jpeg', id: 2),
  ItemModel(name: 'تفاح', value: 'تفاح', img: 'assets/E/a3.jpeg', id: 3),
  ItemModel(name: 'فريز', value: 'فريز', img: 'assets/E/a4.jpeg', id: 4),
  ItemModel(name: 'عنب', value: 'عنب', img: 'assets/E/a5.jpeg', id: 5),
  ItemModel(name: 'برتقال', value: 'برتقال', img: 'assets/E/a6.jpeg', id: 6),
  ItemModel(name: 'موز', value: 'موز', img: 'assets/E/a7.jpeg', id: 7),
];
List<ItemModel> food5 = [
  ItemModel(name: 'لفة', value: 'لفة', img: 'assets/F/a0.jpg', id: 0),
  ItemModel(name: 'بطاطا', value: 'بطاطا', img: 'assets/F/a1.jpg', id: 1),
  ItemModel(name: 'خاثر', value: 'خاثر', img: 'assets/F/a2.jpg', id: 2),
  ItemModel(name: 'لحمة', value: 'لحمة', img: 'assets/F/a3.jpg', id: 3),
  ItemModel(name: 'رز', value: 'رز', img: 'assets/F/a4.jpg', id: 4),
  ItemModel(name: 'مقدوس', value: 'مقدوس', img: 'assets/F/a5.jpg', id: 5),
  ItemModel(name: 'خبز', value: 'خبز', img: 'assets/F/a6.jpg', id: 6),
  ItemModel(name: 'دجاج', value: 'دجاج', img: 'assets/F/a7.jpg', id: 7),
  ItemModel(name: 'بسكوت', value: 'بسكوت', img: 'assets/F/a8.jpg', id: 8),
  ItemModel(name: 'فلافل', value: 'فلافل', img: 'assets/F/a9.jpg', id: 9),
];
List<ItemModel> food6 = [
  ItemModel(name: 'شاي', value: 'شاي', img: 'assets/G/a0.jpg', id: 0),
  ItemModel(name: 'قهوة', value: 'قهوة', img: 'assets/G/a1.jpg', id: 1),
  ItemModel(name: 'ماء', value: 'ماء', img: 'assets/G/a2.jpg', id: 2),
  ItemModel(name: 'حليب', value: 'حليب', img: 'assets/G/a3.jpg', id: 3),
  ItemModel(name: 'عصير', value: 'عصير', img: 'assets/G/a4.jpg', id: 4),
  ItemModel(name: 'متة', value: 'متة', img: 'assets/G/a5.jpg', id: 5),
  ItemModel(name: 'دواء', value: 'دواء', img: 'assets/G/a6.jpg', id: 6),
];
List<ItemModel> food7 = [
  ItemModel(name: 'قميص', value: 'قميص', img: 'assets/H/a0.jpeg', id: 0),
  ItemModel(name: 'جرابات', value: 'جرابات', img: 'assets/H/a1.jpeg', id: 1),
  ItemModel(name: 'داخلي', value: 'داخلي', img: 'assets/H/a2.jpeg', id: 2),
  ItemModel(name: 'طاقية', value: 'طاقية', img: 'assets/H/a3.jpeg', id: 3),
  ItemModel(name: 'كنزة', value: 'كنزة', img: 'assets/H/a4.jpeg', id: 4),
  ItemModel(name: 'جاكيت', value: 'جاكيت', img: 'assets/H/a5.jpeg', id: 5),
  ItemModel(name: 'كلاش', value: 'كلاش', img: 'assets/H/a6.jpeg', id: 6),
  ItemModel(name: 'بنطلون', value: 'بنطلون', img: 'assets/H/a7.jpeg', id: 7),
  ItemModel(name: 'بوط', value: 'بوط', img: 'assets/H/a8.jpeg', id: 8),
];
List<ItemModel> food8 = [
  ItemModel(name: 'الشرطة', value: 'الشرطة', img: 'assets/I/a0.jpeg', id: 0),
  ItemModel(name: 'أسعاف', value: 'أسعاف', img: 'assets/I/a1.jpeg', id: 1),
  ItemModel(name: 'سيارة', value: 'سيارة', img: 'assets/I/a2.jpeg', id: 2),
  ItemModel(name: 'أطفاء', value: 'أطفاء', img: 'assets/I/a3.jpeg', id: 3),
  ItemModel(name: 'بسكليت', value: 'بسكليت', img: 'assets/I/a4.jpeg', id: 4),
  ItemModel(name: 'موتور', value: 'موتور', img: 'assets/I/a5.jpeg', id: 5),
  ItemModel(name: 'طائرة', value: 'طائرة', img: 'assets/I/a6.jpeg', id: 6),
  ItemModel(name: 'طنبر', value: 'طنبر', img: 'assets/I/a7.jpeg', id: 7),
  ItemModel(name: 'باص', value: 'باص', img: 'assets/I/a8.jpeg', id: 8),
];

List<ItemModel> food9 = [
  ItemModel(name: 'عطر', value: 'عطر', img: 'assets/J/a0.jpeg', id: 0),
  ItemModel(name: 'حمام', value: 'حمام', img: 'assets/J/a1.jpeg', id: 1),
  ItemModel(name: 'قصاصة', value: 'قصاصة', img: 'assets/J/a2.jpeg', id: 2),
  ItemModel(name: 'منشفة', value: 'منشفة', img: 'assets/J/a3.jpeg', id: 3),
  ItemModel(name: 'بكلة', value: 'بكلة', img: 'assets/J/a4.jpeg', id: 4),
  ItemModel(name: 'محارم', value: 'محارم', img: 'assets/J/a5.jpeg', id: 5),
  ItemModel(name: 'صابون', value: 'صابون', img: 'assets/J/a6.jpeg', id: 6),
  ItemModel(name: 'ليفة', value: 'ليفة', img: 'assets/J/a7.jpeg', id: 7),
  ItemModel(name: 'مشط', value: 'مشط', img: 'assets/J/a8.jpeg', id: 8),
];
