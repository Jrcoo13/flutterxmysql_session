import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/images.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: Images.slider.length,
            itemBuilder: (context, currentIndex, pageViewIndex) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    Images.slider[currentIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
                height: 200,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, carouselPageChangedReason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: Images.slider.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 15,
                  dotWidth: 15,
                  activeDotColor: Colors.red,
                  dotColor: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
