import 'package:flutter/material.dart';
import 'package:mb_route_transitions/mb_route_transitions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MB Route Transitions',
      initialRoute: 'page1',
      routes: {
        'page1':(context) => Page1(),
        'page2':(context) => Page2(),
      },
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          color: Colors.white,
          onPressed: () {
            //Navigator.push(context, CupertinoPageRoute(builder: ((context) => Page2())));

            MBRouteTransitions(
              context: context,
              child: Page2(), 
              animation: AnimationType.fadeIn,
              replacement: false,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceIn,
              fadeBegin: 0,
              fadeEnd: 1,
            );
          },
          child: const Text("Go to page 2"),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.amber,
      body: const Center(
        child: Text('page 2'),
     ),
   );
  }
}