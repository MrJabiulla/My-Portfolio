import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_string.dart';

class EnhancedWebNavbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? onNavigate;
  final String? activeSection;

  const EnhancedWebNavbar({
    super.key,
    this.onNavigate,
    this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.95),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Right side - Logo with portfolio text
            _buildEnhancedLogo(context),

            // Left side - Navigation items
            _buildNavigationItems(context),


          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItems(BuildContext context) {
    final navItems = [
      {'title': AppStrings.navAbout, 'section': 'about'},
      {'title': AppStrings.navSkills, 'section': 'skills'},
      {'title': AppStrings.navProjects, 'section': 'projects'},
      {'title': AppStrings.navContact, 'section': 'contact'},
    ];

    return Row(
      children: navItems.map((item) {
        return Padding(
          padding: const EdgeInsets.only(right: 40),
          child: _buildAnimatedNavItem(
            context,
            item['title']!,
            item['section']!,
            isActive: activeSection == item['section'],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAnimatedNavItem(
      BuildContext context,
      String title,
      String section, {
        bool isActive = false,
      }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: () => onNavigate?.call(section),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: isActive
                  ? Border.all(color: AppColors.secondary, width: 1)
                  : null,
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isActive ? AppColors.secondary : AppColors.white,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedLogo(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => onNavigate?.call('hero'),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo circle
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.secondaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.secondary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'IJ',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Text
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ismail Jabiulla',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Portfolio',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}