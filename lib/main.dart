import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    Center(child: screen1()),
    Center(child: screen2()),
    Center(child: screen3()),
    Center(child: screen4()),
  ];

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('自傳ApP'),
        ),
        body: tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Alarm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: '期間目標',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '專題計畫',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
              if (index != 0) {
                player.stop();
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {
  final String s1 = '我出身生在一個美麗的小島-澎湖，因為父母比較忙，'
      '們從小都希望我們獨立，基本上只要不出甚麼大事他們並不會干擾我們想要做甚麼'
      '。因為第一個字己寫出來的程式，誤打誤撞開始了我的資工生活。我到目前上課都上的很開心'
      '，目前都沒出現甚麼莫名其妙的問題。';

  @override
  Widget build(BuildContext context) {
    player.play(AssetSource("Free_Test_Data_1MB_MP3.mp3"));

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //先放個標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text("自傳",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          //文字自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(
              s1,
              style: TextStyle(fontSize: 20),
            ),
          ),

          //放一張照片
          Container(
            color: Colors.redAccent,
            height: 200,
            width: 200,
            child: Image.asset('images/f2.jpg'),
          ),
          SizedBox(
            height: 30,
          ),

          //一列放兩個圖
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/f3.png'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/rock.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('學習歷程'),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //有多種排版方式, 此處以最直覺的方式將每一列放文字內容
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("大一時期"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 200,
                child: ListView(
                  children: [
                    //條列式參考
                    Text('學好英文'),
                  ],
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("大二時期"),
            ],
          ),
          SizedBox(
            height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 200,
                child: ListView(
                  children: [
                    Text('組合語言'),
                  ],
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("大三時期"),
            ],
          ),
          SizedBox(
            height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 200,
                child: ListView(
                  children: [
                    Text('考取證照'),
                  ],
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("大四時期"),
            ],
          ),
          SizedBox(
            height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 200,
                child: ListView(
                  children: [
                    Text('人際關係'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '專案方向:\n做個日常可以用的東西',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
