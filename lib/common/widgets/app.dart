import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';

/// 透明背景 AppBar 注册页面
PreferredSizeWidget transparentAppBar({
  required BuildContext context,
  List<Widget>? actions,
}) {
  return AppBar(
    //背景 颜色 透明
    backgroundColor: Colors.transparent,
    // 透明
    elevation: 0,
    //标题 为 空
    title: const Text(''),
    leading: IconButton(
      icon: const Icon(
        // 左侧 按钮  arrow_back图标
        Icons.arrow_back,
        color: AppColors.primaryText,
      ),
      onPressed: () {
        // 返回 上一页
        Navigator.pop(context); // context是上下文 类似于 this
      },
    ),
    //右侧按钮 是 自定义
    actions: actions,
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: duSetWidth(10),
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
