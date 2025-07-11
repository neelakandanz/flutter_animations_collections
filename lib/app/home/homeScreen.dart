import 'package:flutter/material.dart';
import 'package:myapp/app/animation/day_one_animation_screen.dart';


// -----------------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Create a list of the screen widgets you want to navigate to.
  // To add a new day, just add the screen widget to this list.
  final List<Widget> _animationScreens = const [
    DayOneCoffeeAnimationScreen(),
    PowerButtonToggle(),
    // Add DayThreeAnimationScreen() here in the future
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Animation Series')),
      body: ListView.builder(
        // The count is now dynamic, based on our list of screens.
        itemCount: _animationScreens.length,
        itemBuilder: (context, index) {
          // Get the screen for the current index.
          final screen = _animationScreens[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // Navigate to the screen from our list.
                  builder: (context) => screen,
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  // We can generate the title dynamically from the index.
                  // You can customize this title as needed.
                  'Day ${index + 1}:',
                  style: TextStyle(fontSize: 20),
                  // style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
