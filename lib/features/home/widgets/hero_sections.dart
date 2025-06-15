import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/core/utils/extentions.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/utils/helpers.dart';
import 'enhanced_hero_carousel.dart';

class HeroSection extends StatelessWidget {
  final Function(String)? onNav;

  const HeroSection({
    super.key,
    this.onNav,
  });

  @override
  Widget build(BuildContext context) {
    return context.isDesktop ? _buildDesktopHero(context) : _buildMobileHero(context);
  }

  Widget _buildDesktopHero(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 70,
      color: AppColors.black,
      child: Row(
        children: [
          // Left Content Section
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.heroGreeting,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppStrings.heroName,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 52,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildAnimatedText(context),
                  const SizedBox(height: 32),
                  _buildSocialIcons(),
                  const SizedBox(height: 32),
                  _buildNavigationButtons(context),
                ],
              ),
            ),
          ),
          // Right Enhanced Carousel Section
          const Expanded(
            flex: 4,
            child: EnhancedHeroCarousel(), // Using the enhanced carousel here
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHero(BuildContext context) {
    return SizedBox(
      height: context.screenHeight - 56,
      child: Stack(
        children: [
          // Image Carousel
          CarouselSlider(
            options: CarouselOptions(
              height: context.screenHeight - 56,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: false,
            ),
            items: [
              AppAssets.profile,
              AppAssets.profile2,
              AppAssets.profile3,
            ].map((imagePath) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              );
            }).toList(),
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.black.withOpacity(0.7),
                  AppColors.black,
                ],
                stops: const [0.4, 0.8, 1.0],
              ),
            ),
          ),
          // Content
          Positioned(
            left: 20,
            right: 20,
            bottom: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.heroGreeting,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.heroName,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 16),
                _buildAnimatedText(context),
                const SizedBox(height: 24),
                _buildSocialIcons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedText(BuildContext context) {
    return SizedBox(
      height: 60,
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            AppStrings.heroTyping1,
            textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 100),
          ),
          TyperAnimatedText(
            AppStrings.heroTyping2,
            textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 100),
          ),
          TyperAnimatedText(
            AppStrings.heroTyping3,
            textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 3,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      children: [
        _buildSocialIcon(Icons.alternate_email, AppStrings.emailUrl),
        _buildSocialIcon(Icons.code, AppStrings.githubUrl),
        _buildSocialIcon(Icons.business, AppStrings.linkedinUrl),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(icon, color: AppColors.white, size: 24),
          onPressed: () => Helpers.launchUrlString(url),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        _buildNavButton(AppStrings.navAbout, 'about'),
        _buildNavButton(AppStrings.navSkills, 'skills'),
        _buildNavButton(AppStrings.navProjects, 'projects'),
        _buildNavButton(AppStrings.navContact, 'contact'),
      ],
    );
  }

  Widget _buildNavButton(String text, String section) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: OutlinedButton(
        onPressed: () => onNav?.call(section),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.white,
          side: const BorderSide(color: AppColors.secondary, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}