import 'package:flutter/material.dart'; //  这个库 material
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 有状态 组件
class welcome extends StatefulWidget {
  welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  /// 页头标题
  Widget _buildPageHeadTitle() {
    return Text('data');
  }

  /// 页头说明
  Widget _buildPageHeaderDetail() {
    return Text('data');
  }

  /// 特性说明
  /// 宽度 80 + 20 + 195 = 295
  Widget _buildFeatureItem() {
    //String imageName, String intro, double marginTop
    return Text('data');
  }

  /// 开始按钮
  Widget _buildStartButton() {
    return Text('data');
  }

  @override
  Widget build(BuildContext context) {
    //height高度去掉 顶部，底部 导航 812 - 44 - 34=812-78= 734
    //width 375
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 734),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            _buildPageHeadTitle(),
            _buildPageHeaderDetail(),
            _buildFeatureItem(),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }
}
