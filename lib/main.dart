import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painting"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 200,
            color: Colors.purple,
            child: UnconstrainedBox(
              child: FractionalTranslation(
                translation: Offset(0.25, 0),
                child: ClipRect(
                  //use with align
                  child: Align(
                    alignment: Alignment.topLeft, //no effect
                    heightFactor: 0.5,
                    widthFactor: 0.5,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.red,
                  Colors.orange,
                  Colors.purple,
                  Colors.amber
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.2,
                  0.5,
                  0.7,
                  0.9
                ], //always from smaller to greater value
                tileMode: TileMode.repeated,
              ),
            ),
            child: SizedBox(
              width: 120,
              height: 120,
              child: FlatButton(
                onPressed: () {},
                child: Text("Hello"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                  center: Alignment.topLeft,
                  tileMode:
                      TileMode.mirror, //change this property to view effects
                  colors: <Color>[
                    Colors.yellow,
                    Colors.deepOrange,
                  ]).createShader(bounds);
            },
            child: Text(
              "Shader Mask Applied Text",
              style: TextStyle(
                fontSize: 60,
                color: Colors
                    .white, //Colors.white required to get effect by shader mask
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
