import 'dart:async';

import 'package:covid_tracker_app_with_provider/Presentation/World_States_Screen/world_states_screen.dart';
import 'package:covid_tracker_app_with_provider/Utils/App_Images/app_images.dart';
import 'package:covid_tracker_app_with_provider/Utils/App_Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../Widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorldStatesScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: AssetImage(AppImages.appLogo),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * math.pi,
                    child: child,
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              CustomText(
                text: 'Covid-19\nTracker App',
                style: AppTextStyles.heading1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
