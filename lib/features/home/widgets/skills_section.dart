import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extentions.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_string.dart';
import '../model/skils.dart';


class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    final totalSkills = AppSkills.getAllSkills().length;
    _animationControllers = List.generate(
      totalSkills,
          (index) => AnimationController(
        duration: Duration(milliseconds: 1200 + (index * 80)),
        vsync: this,
      ),
    );

    _animations = _animationControllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startAnimations() {
    if (!_hasAnimated) {
      _hasAnimated = true;
      for (int i = 0; i < _animationControllers.length; i++) {
        Future.delayed(Duration(milliseconds: i * 100), () {
          if (mounted) {
            _animationControllers[i].forward();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isDesktop ? 80 : 60,
          horizontal: context.isDesktop ? 80 : 24,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Column(
              children: [
                _buildSectionHeader(context),
                const SizedBox(height: 60),
                _buildSkillsContent(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.skillsTitle,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.secondaryGradient,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.skillsSubtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSkillsContent(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimations();
    });

    return Column(
      children: [
        // Skills grid
        _buildSkillsGrid(context),
        const SizedBox(height: 60),
        // Technology showcase
        _buildTechnologyShowcase(context),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    final skillCategories = [
      {
        'title': 'Core Technologies',
        'skills': AppSkills.coreSkills,
        'color': AppColors.secondary,
        'icon': Icons.code,
      },
      {
        'title': 'Backend & APIs',
        'skills': AppSkills.backendSkills,
        'color': AppColors.primary,
        'icon': Icons.storage,
      },
      {
        'title': 'Architecture & State Management',
        'skills': AppSkills.architectureSkills,
        'color': AppColors.accent,
        'icon': Icons.architecture,
      },
      {
        'title': 'Payments & Authentication',
        'skills': AppSkills.integrationSkills,
        'color': AppColors.success,
        'icon': Icons.security,
      },
    ];

    return context.isDesktop
        ? _buildDesktopSkillsGrid(context, skillCategories)
        : _buildMobileSkillsGrid(context, skillCategories);
  }

  Widget _buildDesktopSkillsGrid(BuildContext context, List<Map<String, dynamic>> skillCategories) {
    int animationIndex = 0;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 32,
        mainAxisSpacing: 32,
        childAspectRatio: 1.2,
      ),
      itemCount: skillCategories.length,
      itemBuilder: (context, index) {
        final category = skillCategories[index];
        final categoryWidget = _buildSkillCategoryCard(
          context,
          category['title'] as String,
          category['skills'] as List<Skill>,
          category['color'] as Color,
          category['icon'] as IconData,
          animationIndex,
        );
        animationIndex += (category['skills'] as List<Skill>).length;
        return categoryWidget;
      },
    );
  }

  Widget _buildMobileSkillsGrid(BuildContext context, List<Map<String, dynamic>> skillCategories) {
    int animationIndex = 0;

    return Column(
      children: skillCategories.map((category) {
        final categoryWidget = _buildSkillCategoryCard(
          context,
          category['title'] as String,
          category['skills'] as List<Skill>,
          category['color'] as Color,
          category['icon'] as IconData,
          animationIndex,
        );
        animationIndex += (category['skills'] as List<Skill>).length;
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: categoryWidget,
        );
      }).toList(),
    );
  }

  Widget _buildSkillCategoryCard(
      BuildContext context,
      String title,
      List<Skill> skills,
      Color color,
      IconData icon,
      int startIndex,
      ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Skills list
          Expanded(
            child: ListView.builder(
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildSkillBar(
                    context,
                    skills[index],
                    color,
                    _animations[startIndex + index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillBar(
      BuildContext context,
      Skill skill,
      Color color,
      Animation<double> animation,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                skill.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                if (skill.level != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getLevelColor(skill.level!).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      skill.level!,
                      style: TextStyle(
                        color: _getLevelColor(skill.level!),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Text(
                      '${(skill.percentage * animation.value).round()}%',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(3),
          ),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (skill.percentage / 100) * animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.7)],
                    ),
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'expert':
        return AppColors.success;
      case 'advanced':
        return AppColors.secondary;
      case 'learning':
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }

  Widget _buildTechnologyShowcase(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Technology Stack',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Technologies I work with daily as MrJabiulla',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _buildTechGrid(context),
        ],
      ),
    );
  }

  Widget _buildTechGrid(BuildContext context) {
    final technologies = AppSkills.technologies;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 8 : 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: technologies.length,
      itemBuilder: (context, index) {
        return _buildTechIcon(context, technologies[index]);
      },
    );
  }

  Widget _buildTechIcon(BuildContext context, Technology tech) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white.withOpacity(0.2)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Could show tech details
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  tech.icon,
                  size: context.isDesktop ? 28 : 24,
                  color: AppColors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  tech.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: context.isDesktop ? 11 : 9,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}