import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_color.dart';

class EnhancedHeroCarousel extends StatefulWidget {
  const EnhancedHeroCarousel({super.key});

  @override
  State<EnhancedHeroCarousel> createState() => _EnhancedHeroCarouselState();
}

class _EnhancedHeroCarouselState extends State<EnhancedHeroCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController(); // Fixed controller type

  final List<String> _images = [
    AppAssets.desktopProfile,
    AppAssets.profile,
    AppAssets.profile2,
    AppAssets.profile3,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.black,
            AppColors.black.withOpacity(0.8),
            Colors.grey.shade900,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Carousel
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height - 70,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.easeInOutCubic,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _images.map((imagePath) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              );
            }).toList(),
          ),

          // Navigation Arrows
          Positioned(
            left: 20,
            top: 0,
            bottom: 0,
            child: Center(
              child: _buildNavigationButton(
                Icons.arrow_back_ios,
                    () => _carouselController.previousPage(), // Fixed method name
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            bottom: 0,
            child: Center(
              child: _buildNavigationButton(
                Icons.arrow_forward_ios,
                    () => _carouselController.nextPage(), // Fixed method name
              ),
            ),
          ),

          // Indicators
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildIndicators(),
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.black.withOpacity(0.3),
                  Colors.transparent,
                  Colors.transparent,
                ],
                stops: const [0.0, 0.3, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.5),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.secondary.withOpacity(0.5)),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _images.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _carouselController.animateToPage(entry.key),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentIndex == entry.key ? 12 : 8,
            height: _currentIndex == entry.key ? 12 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == entry.key
                  ? AppColors.secondary
                  : AppColors.white.withOpacity(0.4),
              border: Border.all(
                color: AppColors.secondary.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}