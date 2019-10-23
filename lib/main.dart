import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      home: Center(
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: AnimatedButton(icon: Icon(Icons.thumb_up,color: Colors.red,size: 60,),)),
          Center(child: AnimatedButton(icon: Icon(Icons.favorite,color: Colors.red,size: 60,),)),
          Center(child: AnimatedButton(icon: Icon(Icons.notifications_active,color: Colors.red,size: 60,),)),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  Icon icon;

  AnimatedButton({this.icon});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this, value: 0);
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      print(controller.value);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation smoothAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInExpo);
    return GestureDetector(
      onTap: () {
        controller.forward();
      },
      child: Container(
        width: 150,
        height: 150,
        color: Colors.white,
        child: Transform.scale(
          scale: Tween(begin: 1.0, end: 1.5).transform(controller.value),
          child: widget.icon,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleVisible() {
    print('Button clicked');
  }
}
