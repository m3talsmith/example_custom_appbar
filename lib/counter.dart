import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'home.dart';
import 'screen_background.dart';
import 'iced_container.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 0,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
        title: CustomAppBar(
          leading: [
            CustomerAppBarItem(
              title: 'Home',
              icon: Icons.home_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            CustomerAppBarItem(
              title: 'Counter',
              icon: Icons.calculate_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Counter()),
                );
              },
              isActive: true,
            ),
          ],
          actions: [
            CustomerAppBarItem(
              title: 'Reset',
              icon: Icons.restart_alt_rounded,
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
            ),
          ],
          title: 'Counter',
        ),
      ),
      body: ScreenBackground(
        child: Center(
          child: IcedContainer(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
