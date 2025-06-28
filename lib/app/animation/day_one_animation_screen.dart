import 'package:flutter/material.dart';
import 'dart:async';

class DayOneCoffeeAnimationScreen extends StatefulWidget {
  const DayOneCoffeeAnimationScreen({super.key});

  @override
  // The State class now correctly corresponds to the updated widget name.
  State<DayOneCoffeeAnimationScreen> createState() => _DayOneCoffeeAnimationScreenState();
}

// The State class is linked to the corrected widget name.
class _DayOneCoffeeAnimationScreenState extends State<DayOneCoffeeAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _liquidController;
  late Animation<double> _liquidHeightAnimation;

  late AnimationController _smokeController1;
  late Animation<double> _smokeOneBottomAnimation;
  late Animation<double> _smokeOneOpacityAnimation;

  late AnimationController _smokeController2;
  late Animation<double> _smokeTwoBottomAnimation;
  late Animation<double> _smokeTwoOpacityAnimation;

  late AnimationController _smokeController3;
  late Animation<double> _smokeThreeBottomAnimation;
  late Animation<double> _smokeThreeOpacityAnimation;
  
  late AnimationController _smokeController4;
  late Animation<double> _smokeForBottomAnimation;
  late Animation<double> _smokeForOpacityAnimation;


  @override
  void initState() {
    super.initState();

    // Liquid Animation
    _liquidController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _liquidHeightAnimation = Tween<double>(begin: 0, end: 62).animate(
      CurvedAnimation(
        parent: _liquidController,
        curve: const Interval(0.05, 0.20, curve: Curves.linear),
      ),
    );
    
    Timer(const Duration(seconds: 4), () {
        if(mounted){
          _liquidController.repeat();
        }
    });


    // Smoke One Animation
    _smokeController1 = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);

    _smokeOneBottomAnimation = Tween<double>(begin: 20.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _smokeController1,
        curve: const Interval(0.0, 0.8, curve: Curves.linear),
      ),
    );
    _smokeOneOpacityAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _smokeController1,
        curve: const Interval(0.0, 0.4, curve: Curves.linear),
      ),
    );
    _smokeController1.addStatusListener((status) {
       if(status == AnimationStatus.completed){
         Timer(const Duration(seconds: 4), (){
           if(mounted){
             _smokeController1.forward(from: 0);
           }
         });
       }
    });

    Timer(const Duration(seconds: 4), () {
       if(mounted){
        _smokeController1.forward();
       }
    });


    // Smoke Two Animation
    _smokeController2 = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    
    _smokeTwoBottomAnimation = Tween<double>(begin: 40.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _smokeController2,
        curve: const Interval(0.0, 0.8, curve: Curves.linear),
      ),
    );

    _smokeTwoOpacityAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _smokeController2,
        curve: const Interval(0.0, 0.4, curve: Curves.linear),
      ),
    );
    _smokeController2.addStatusListener((status) {
       if(status == AnimationStatus.completed){
         Timer(const Duration(seconds: 5), (){
           if(mounted){
             _smokeController2.forward(from: 0);
           }
         });
       }
    });
     Timer(const Duration(seconds: 5), () {
       if(mounted){
        _smokeController2.forward();
       }
    });


    // Smoke Three Animation
    _smokeController3 = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    _smokeThreeBottomAnimation = Tween<double>(begin: 40.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _smokeController3,
        curve: const Interval(0.0, 0.8, curve: Curves.linear),
      ),
    );
     _smokeThreeOpacityAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _smokeController3,
        curve: const Interval(0.0, 0.4, curve: Curves.linear),
      ),
    );
      _smokeController3.addStatusListener((status) {
       if(status == AnimationStatus.completed){
         Timer(const Duration(seconds: 6), (){
           if(mounted){
            _smokeController3.forward(from: 0);
           }
         });
       }
    });
     Timer(const Duration(seconds: 6), () {
       if(mounted){
        _smokeController3.forward();
       }
    });

     // Smoke For Animation
    _smokeController4 = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    _smokeForBottomAnimation = Tween<double>(begin: 20.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _smokeController4,
        curve: const Interval(0.0, 0.8, curve: Curves.linear),
      ),
    );
     _smokeForOpacityAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _smokeController4,
        curve: const Interval(0.0, 0.4, curve: Curves.linear),
      ),
    );
    _smokeController4.addStatusListener((status) {
       if(status == AnimationStatus.completed){
         Timer(const Duration(seconds: 5), (){
          if(mounted){
           _smokeController4.forward(from: 0);
          }
         });
       }
    });
    
     Timer(const Duration(seconds: 5), () {
       if(mounted){
         _smokeController4.forward();
       }
    });


  }

  @override
  void dispose() {
    _liquidController.dispose();
    _smokeController1.dispose();
    _smokeController2.dispose();
    _smokeController3.dispose();
    _smokeController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
       Center(
        child: Container(
          width: 300,
          height: 280,
          child: Stack(
            children: [
              // Coffee Header
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDDCFCC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      // Button One
                      Positioned(
                        top: 25,
                        left: 15,
                        child: Column(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: Color(0xFF282323),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 8,
                              height: 8,
                              color: const Color(0xFF615E5E),
                            ),
                          ],
                        ),
                      ),
                      // Button Two
                      Positioned(
                        top: 25,
                        left: 50,
                        child: Column(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: Color(0xFF282323),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 8,
                              height: 8,
                              color: const Color(0xFF615E5E),
                            ),
                          ],
                        ),
                      ),
                      // Display
                      Positioned(
                        top: 15,
                        left: 125,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF9ACFC5),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF43BEAE),
                              width: 5,
                            ),
                          ),
                        ),
                      ),
                      // Details
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: [
                            Container(width: 8, height: 20, color: const Color(0xFF9B9091)),
                            const SizedBox(width: 12),
                            Container(width: 8, height: 20, color: const Color(0xFF9B9091)),
                             const SizedBox(width: 12),
                            Container(width: 8, height: 20, color: const Color(0xFF9B9091)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Coffee Medium
              Positioned(
                top: 80,
                left: 15,
                child: Container(
                  width: 270,
                  height: 160,
                  color: const Color(0xFFBCB0AF),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 13.5,
                        child: Container(
                          width: 243,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFF776F6E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      // Exit
                      Positioned(
                        top: 0,
                        left: 105,
                        child: Column(
                          children: [
                            Container(width: 60, height: 20, color: const Color(0xFF231F20)),
                            const SizedBox(height: 0),
                             Container(
                              width: 50,
                               height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFF231F20),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                             Container(width: 10, height: 10, color: const Color(0xFF231F20)),
                          ],
                        ),
                      ),
                      // Arm
                      Positioned(
                        top: 15,
                        right: 25,
                        child: Row(
                          children: [
                            Container(width: 15, height: 5, color: const Color(0xFF9E9495)),
                            Container(width: 70, height: 20, color: const Color(0xFF231F20)),
                          ],
                        ),
                      ),
                      // Liquid
                      AnimatedBuilder(
                        animation: _liquidController,
                        builder: (context, child) {
                          return Positioned(
                            top: 50,
                            left: 132,
                            child: Opacity(
                              opacity: _liquidController.status == AnimationStatus.forward ? 1.0 : 0.0,
                              child: Container(
                                width: 6,
                                height: _liquidHeightAnimation.value,
                                color: const Color(0xFF74372B),
                              ),
                            ),
                          );
                        },
                      ),
                      // Cup
                      Positioned(
                        bottom: 0,
                        left: 95,
                        child: SizedBox(
                           width: 80,
                            height: 47,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.elliptical(110, 70),
                                  ),
                                ),
                              ),
                              Positioned(
                                 top: 6,
                                 right: -20,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 5)
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Smoke One
                       AnimatedBuilder(
                        animation: _smokeController1,
                        builder: (context, child) {
                          return Positioned(
                            bottom: _smokeOneBottomAnimation.value,
                            left: 102,
                            child: Opacity(
                              opacity: _smokeOneOpacityAnimation.value,
                              child: Container(
                                width: 8,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB3AEAE),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                       // Smoke Two
                      AnimatedBuilder(
                        animation: _smokeController2,
                        builder: (context, child) {
                          return Positioned(
                            bottom: _smokeTwoBottomAnimation.value,
                            left: 118,
                            child: Opacity(
                              opacity: _smokeTwoOpacityAnimation.value,
                              child: Container(
                                width: 8,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB3AEAE),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                        // Smoke Three
                      AnimatedBuilder(
                        animation: _smokeController3,
                        builder: (context, child) {
                          return Positioned(
                             bottom: _smokeThreeBottomAnimation.value,
                             right: 118,
                            child: Opacity(
                               opacity: _smokeThreeOpacityAnimation.value,
                              child: Container(
                                width: 8,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB3AEAE),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                       // Smoke For
                      AnimatedBuilder(
                        animation: _smokeController4,
                        builder: (context, child) {
                          return Positioned(
                             bottom: _smokeForBottomAnimation.value,
                            right: 102,
                            child: Opacity(
                              opacity: _smokeForOpacityAnimation.value,
                              child: Container(
                                width: 8,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB3AEAE),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
      
                    ],
                  ),
                ),
              ),
              // Coffee Footer
              Positioned(
                bottom: 25,
                left: 7.5,
                child: Container(
                  width: 285,
                  height: 15,
                  decoration: BoxDecoration(
                    color: const Color(0xFF41BDAD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: -0.5,
                child: Container(
                  width: 300,
                  height: 26,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}