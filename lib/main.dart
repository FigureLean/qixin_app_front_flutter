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
    return  Scaffold(
      backgroundColor: Color(0xFAFAFA),
      body: Align(
        alignment: Alignment.center, // 确保Align组件居中对齐其子组件
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80,bottom: 40),
              child:  CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey[300],
                child: Text(
                  '栖\n心',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Expanded( // 使用Flexible组件来填充剩余空间
              child: BrnShadowCard(

                color: Colors.white,
                circular: 20,
                // borderWidth: 10,

                child: Container(
                  width: double.infinity, // 设置宽度为100%，即double.infinity
                  child: const Text(
                    '阴影卡片，\n这是内容区域',
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center, // 使文本居中
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}
