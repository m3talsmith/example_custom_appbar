import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'iced_container.dart';
import 'screen_background.dart';
import 'counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              isActive: true,
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
            ),
          ],
          title: 'Home',
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
            child: Center(child: Text('Welcome!')),
          ),
        ),
      ),
    );
  }
}
