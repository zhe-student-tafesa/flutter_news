import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';

import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toastInfo({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) async {
  return await Fluttertoast.showToast(
    //使用这个 showToast 方法
    msg: msg,
    toastLength: Toast.LENGTH_SHORT, // 时间长短
    gravity: ToastGravity.TOP, // 出现 位置
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: duSetFontSize(16),
  );
}
