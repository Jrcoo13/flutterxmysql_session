import 'package:code/route/route_manager.dart';
import 'package:code/utils/global_variables.dart';
import 'package:code/utils/my_shared_preference.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final _sharedPreference = MySharedPreference();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 600).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();

    _onStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: _animation.value,
          width: _animation.value,
          child: Image.asset(Images.logo),
        ),
      ),
    );
  }

  void _onStart() async {
    currentUser = await _sharedPreference.getUser();

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    if (currentUser != null && currentUser?.id != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteManager.home, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteManager.login, (route) => false);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
