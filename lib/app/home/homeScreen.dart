import 'package:flutter/material.dart';
import 'package:myapp/app/animation/day_one_animation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation Series'),
      ),
      body: ListView.builder(
        itemCount: 1, // We'll update this as we add more days
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DayOneCoffeeAnimationScreen(),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Day ${index + 1}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}