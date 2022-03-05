import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // fullName email password 的控制器
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // 返回上一页
  _handleNavPop() {
    Navigator.pop(context);
  }

  // 执行注册操作
  _handleSignUp() {
    if (!duCheckStringLength(_fullnameController.value.text, 5)) {
      toastInfo(msg: '用户名不能小于5位');
      return;
    }
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    Navigator.pop(context);
  }

//////////////////////////////////
  // logo  显示"Sign up"
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text(
        "Sign up",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      // height: 204,
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // fullName input，使用 自己 封装的组件 inputTextEdit
          inputTextEdit(
            controller: _fullnameController,
            keyboardType: TextInputType.text,
            hintText: "Full name",
            marginTop: 0,
          ),
          // email input
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
          ),
          // password input
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),

          // 创建
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: btnFlatButtonWidget(
              onPressed: _handleSignUp,
              width: 295,
              fontWeight: FontWeight.w600,
              title: "Create an account",
            ),
          ),
          // Spacer(),

          // Fogot password
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: FlatButton(
              onPressed: _handleSignUp,
              child: Text(
                "Fogot password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavPop,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "I have an account",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //防止 软键盘 把 控件 挡住
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        //上下文
        context: context,
        //右侧 图标
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
