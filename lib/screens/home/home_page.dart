import 'package:flutter/material.dart';
import '../../widgets/image_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          SizedBox(
            height: 10,
          ),
          ImageSlider(),
        ],
      ),
    );
  }
}
