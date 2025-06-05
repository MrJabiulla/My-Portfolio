import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extentions.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/utils/helpers.dart';


class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        vertical: context.isDesktop ? 80 : 60,
        horizontal: context.isDesktop ? 80 : 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: context.isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Profile image
        Expanded(
          flex: 2,
          child: _buildProfileImage(context),
        ),
        const SizedBox(width: 80),
        // Right side - Content
        Expanded(
          flex: 3,
          child: _buildContent(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context),
        const SizedBox(height: 40),
        _buildContent(context),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Center(
      child: Container(
        width: context.isDesktop ? 300 : 250,
        height: context.isDesktop ? 300 : 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AppAssets.aboutProfile,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        // Section title
        Text(
          AppStrings.aboutTitle,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 24),

        // Biography
        _buildBiography(context),
        const SizedBox(height: 32),

        // Stats row
        _buildStatsRow(context),
        const SizedBox(height: 32),

        // Action buttons
        _buildActionButtons(context),
        const SizedBox(height: 32),

        // Social links
        _buildSocialLinks(context),
      ],
    );
  }

  Widget _buildBiography(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.aboutBio1,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: AppColors.textPrimary,
          ),
          textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.aboutBio2,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: AppColors.textPrimary,
          ),
          textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.aboutBio3,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: AppColors.textPrimary,
          ),
          textAlign: context.isDesktop ? TextAlign.left : TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return context.isDesktop
        ? Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildStatCard(context, "3+", "Years Experience"),
        const SizedBox(width: 32),
        _buildStatCard(context, "15+", "Projects Completed"),
        const SizedBox(width: 32),
        _buildStatCard(context, "5+", "Technologies"),
      ],
    )
        : Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard(context, "3+", "Years Experience"),
            _buildStatCard(context, "15+", "Projects Completed"),
          ],
        ),
        const SizedBox(height: 16),
        _buildStatCard(context, "5+", "Technologies"),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String number, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.secondary.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return context.isDesktop
        ? Row(
      children: [
        _buildResumeButton(context),
        const SizedBox(width: 16),
        _buildContactButton(context),
      ],
    )
        : Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: _buildResumeButton(context),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: _buildContactButton(context),
        ),
      ],
    );
  }

  Widget _buildResumeButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _downloadResume(),
      icon: const Icon(Icons.download, size: 20),
      label: const Text('Download Resume'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => Helpers.launchUrlString(AppStrings.emailUrl),
      icon: const Icon(Icons.mail_outline, size: 20),
      label: const Text('Get In Touch'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.secondary,
        side: const BorderSide(color: AppColors.secondary, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'Connect with me:',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: context.isDesktop
              ? WrapAlignment.start
              : WrapAlignment.center,
          children: [
            _buildSocialButton(
              context,
              'GitHub',
              Icons.code,
              AppColors.github,
              AppStrings.githubUrl,
            ),
            _buildSocialButton(
              context,
              'LinkedIn',
              Icons.business,
              AppColors.linkedin,
              AppStrings.linkedinUrl,
            ),
            _buildSocialButton(
              context,
              'Email',
              Icons.email,
              AppColors.error,
              AppStrings.emailUrl,
            ),
            _buildSocialButton(
              context,
              'Twitter',
              Icons.alternate_email,
              AppColors.twitter,
              AppStrings.twitterUrl,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(
      BuildContext context,
      String label,
      IconData icon,
      Color color,
      String url,
      ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Helpers.launchUrlString(url),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: AppColors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _downloadResume() async {
    try {
      // You can implement different strategies here:
      // 1. Open PDF in browser
      // 2. Download from server
      // 3. Open local asset (for demo)

      // For now, we'll open the resume URL (you can host your PDF online)
      await Helpers.launchUrlString(AppStrings.resumeUrl);

      // Alternative: If you want to show a message
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Resume download started!'),
      //     backgroundColor: AppColors.success,
      //   ),
      // );
    } catch (e) {
      // Handle error
      debugPrint('Error downloading resume: $e');
    }
  }
}