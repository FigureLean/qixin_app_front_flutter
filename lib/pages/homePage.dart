import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageDetails(),
    );
  }
}

class HomePageDetails extends StatelessWidget {
  const HomePageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            // title: Text("This is AppBar"),
            backgroundColor: Colors.white,
            centerTitle: true,
            toolbarHeight: 15,
            elevation: 0.0,
            bottom: const TabBar(
              isScrollable: false, // 是否可滚动
              labelStyle: TextStyle(fontSize: 20), // 选中 label 的 Style
              unselectedLabelStyle:
                  TextStyle(fontSize: 20), // 未选中 label 的 Style
              indicatorColor: Colors.lightBlueAccent, // 指示器颜色
              unselectedLabelColor: Colors.grey, // 未选中 label 颜色
              labelColor: Colors.lightBlueAccent, // 选中 label 颜色
              tabs: <Widget>[
                // 显示的标签内容
                Tab(
                  text: "文章",
                ),
                Tab(
                  text: "漂流瓶",
                ),
              ],
            ),
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Image.asset("sources/images/yuban.jpg"),
                    RichText(
                        text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: const <InlineSpan>[
                          TextSpan(text: "asdgfsdf"),
                          TextSpan(text: "dfhdffhdfg"),
                        ]))
                  ],
                ),
                ListView(
                  children: const [Text("text2")],
                )
              ],
            ),
          )),
    );
  }
}
