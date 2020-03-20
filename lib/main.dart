import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/progressbar': (context) => ProgressBar(
              maxValue: 100,
              curentValue: 70,
            ),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Bar'),
      ),
      body: Center(
        child: Container(
            child: RaisedButton(
                child: Text('Next'),
                onPressed: () {
                  Navigator.pushNamed(context, '/progressbar');
                })),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  ProgressBar({this.maxValue, this.curentValue});
  //final double width;
  final double height = 25.0;
  final double ratio = 0.5;
  final double curentValue;
  final int maxValue;
  
  // void statesetter(){
  //   Builder(builder: BuildContext context,)
  //     width = MediaQuery.of(context).size.width*ratio;

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(Icons.money_off),
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * ratio,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                ),
                Positioned(
                    top: height+10,
                    left: 0,
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )),
                Positioned(
                    top: height+10,
                    left: (MediaQuery.of(context).size.width*ratio)-20,
                    child: Text(
                      '$maxValue',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )),
                Positioned(
                    top: height+10,
                    left: ((MediaQuery.of(context).size.width*ratio) / 2)-20,
                    child: Text(
                      '${maxValue/2}',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )),
                Container(
                  width: (curentValue*MediaQuery.of(context).size.width*ratio)/maxValue,
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
