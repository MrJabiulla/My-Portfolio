import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_string.dart';

class WebNavbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? onNavigate;

  const WebNavbar({
    super.key,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side - Navigation items
            _buildNavigationItems(context),

            // Right side - Logo
            _buildLogo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItems(BuildContext context) {
    return Row(
      children: [
        _buildNavItem(context, AppStrings.navAbout, 'about'),
        const SizedBox(width: 32),
        _buildNavItem(context, AppStrings.navSkills, 'skills'),
        const SizedBox(width: 32),
        _buildNavItem(context, AppStrings.navProjects, 'projects'),
        const SizedBox(width: 32),
        _buildNavItem(context, AppStrings.navContact, 'contact'),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String section) {
    return InkWell(
      onTap: () => onNavigate?.call(section),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'IJ',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Ismail Jabiulla',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}