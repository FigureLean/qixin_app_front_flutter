import 'package:flutter/material.dart';
import 'pages/homePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("首页"),
          leading: const Icon(Icons.menu),
          actions: const [
            Icon(Icons.settings),
          ],
          backgroundColor: Colors.lightBlue,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: const HomePageBody(),
      )
    );
  }
}


class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "首页内容",
          style: TextStyle(fontSize: 20, color: Colors.red),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
        RichText(
            text: const TextSpan(
              text: "富文本",
              style: TextStyle(
                  color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
            )),
        Container(
          width: 300,
          height: 300,
          color: Colors.red,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.all(20),
          child: const Text(
            "我是一个容器",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: const Text("跳转到页面1"),
        )
      ],
    );
  }
}
