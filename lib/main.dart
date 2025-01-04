import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Stack(
              clipBehavior: Clip.none, // 确保堆叠的组件不会被裁剪
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundColor: Color(0xffF7F7F7),
                  child: Text(
                    '栖\n心',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                CircleAvatar(
                  radius: 100, // 外圈的半径比内圈大
                  backgroundColor: Colors.grey.withOpacity(0.3), // 可以根据需要调整颜色和透明度
                ),
              ],
            )
          ),
          Expanded( // 将 Expanded 用于 BrnShadowCard
            child: BrnShadowCard(
              color: Colors.white,
              circular: 20.0,
              blurRadius: 200.0,
              child: SingleChildScrollView( // 在 Expanded 内部使用 SingleChildScrollView
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 80),
                      child: buildLoginTitle(),
                    ),
                    PhoneNumberForm(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 80),
                      child: Container(
                        width: 250,
                        height: 50,
                        //在此设置
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(colors: [
                          Color(0xff737373),
                          Color(0xff0F0F0F)
                          ]),
                        ),
                        child: ElevatedButton(

                          style: ButtonStyle(
                            //去除阴影
                            elevation: MaterialStateProperty.all(0),
                            //将按钮背景设置为透明
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          ), onPressed: () {  },

                          child: const Text(
                            '立即登录',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      )

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildLoginTitle() {
  return const Text(
    "验证码登录",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
  );
}

class PhoneNumberForm extends StatelessWidget {
  final TextEditingController _verifierController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 80, right: 80),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "请输入手机号码",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 80, right: 80),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _verifierController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "验证码",
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("验证码"),
                        content: Text(_verifierController.text),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('关闭'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("获取验证码"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}