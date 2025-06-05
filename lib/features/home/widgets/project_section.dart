import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/utils/extentions.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/utils/helpers.dart';

enum ProjectCategory {
  mobileApp,
  webApp,
  backend,
  library,
  tool,
  game,
  other,
}

enum ProjectStatus {
  completed,
  inProgress,
  maintenance,
  archived,
  planning,
}

extension ProjectCategoryExtension on ProjectCategory {
  String get displayName {
    switch (this) {
      case ProjectCategory.mobileApp:
        return 'Mobile App';
      case ProjectCategory.webApp:
        return 'Web App';
      case ProjectCategory.backend:
        return 'Backend';
      case ProjectCategory.library:
        return 'Library';
      case ProjectCategory.tool:
        return 'Tool';
      case ProjectCategory.game:
        return 'Game';
      case ProjectCategory.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case ProjectCategory.mobileApp:
        return Icons.phone_android;
      case ProjectCategory.webApp:
        return Icons.web;
      case ProjectCategory.backend:
        return Icons.storage;
      case ProjectCategory.library:
        return Icons.library_books;
      case ProjectCategory.tool:
        return Icons.build;
      case ProjectCategory.game:
        return Icons.games;
      case ProjectCategory.other:
        return Icons.folder;
    }
  }
}

extension ProjectStatusExtension on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.maintenance:
        return 'Maintenance';
      case ProjectStatus.archived:
        return 'Archived';
      case ProjectStatus.planning:
        return 'Planning';
    }
  }

  Color get color {
    switch (this) {
      case ProjectStatus.completed:
        return const Color(0xFF4CAF50);
      case ProjectStatus.inProgress:
        return const Color(0xFF2196F3);
      case ProjectStatus.maintenance:
        return const Color(0xFFFF9800);
      case ProjectStatus.archived:
        return const Color(0xFF9E9E9E);
      case ProjectStatus.planning:
        return const Color(0xFF9C27B0);
    }
  }

  IconData get icon {
    switch (this) {
      case ProjectStatus.completed:
        return Icons.check_circle;
      case ProjectStatus.inProgress:
        return Icons.sync;
      case ProjectStatus.maintenance:
        return Icons.build;
      case ProjectStatus.archived:
        return Icons.archive;
      case ProjectStatus.planning:
        return Icons.schedule;
    }
  }
}

class Project {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final String? githubUrl;
  final String? demoUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final List<String> technologies;
  final List<String> features;
  final ProjectCategory category;
  final ProjectStatus status;
  final DateTime createdDate;
  final DateTime? updatedDate;
  final int? stars;
  final int? forks;
  final bool isFeatured;
  final Color primaryColor;
  final Color secondaryColor;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    this.githubUrl,
    this.demoUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.technologies,
    required this.features,
    required this.category,
    required this.status,
    required this.createdDate,
    this.updatedDate,
    this.stars,
    this.forks,
    this.isFeatured = false,
    required this.primaryColor,
    required this.secondaryColor,
  });
}

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int _hoveredCard = -1;
  String _selectedCategory = 'All';
  bool _showFilters = false;
  List<Project> _filteredProjects = [];

  // MrJabiulla's Projects - Updated for 2025-06-05
  final List<Project> _projects = [
    Project(
      id: 'flutter-ecommerce',
      title: 'FlutterStore Pro',
      shortDescription: 'Advanced e-commerce platform with AI recommendations',
      description: 'A comprehensive e-commerce mobile application built with Flutter, featuring modern UI/UX design, AI-powered product recommendations, real-time notifications, secure payment integration with Stripe and Apple Pay, clean architecture, and advanced analytics dashboard.',
      githubUrl: 'https://github.com/MrJabiulla/flutter-ecommerce-pro',
      demoUrl: 'https://mrjabiulla.github.io/flutter-ecommerce-demo',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.mrjabiulla.flutterstore',
      technologies: ['Flutter', 'Dart', 'Firebase', 'Stripe', 'Apple Pay', 'Bloc', 'Clean Architecture', 'AI/ML'],
      features: [
        'AI Product Recommendations',
        'Multi-Payment Integration',
        'Real-time Chat Support',
        'Advanced Analytics',
        'Multi-language Support',
        'Offline Mode',
        'Push Notifications',
        'Admin Dashboard',
      ],
      category: ProjectCategory.mobileApp,
      status: ProjectStatus.completed,
      createdDate: DateTime(2024, 8, 15),
      updatedDate: DateTime(2025, 6, 1),
      stars: 234,
      forks: 67,
      isFeatured: true,
      primaryColor: const Color(0xFF00ADB5),
      secondaryColor: const Color(0xFF393E46),
    ),

    Project(
      id: 'social-connect-2025',
      title: 'ConnectHub 2025',
      shortDescription: 'Next-gen social platform with Web3 integration',
      description: 'Revolutionary social media application featuring Web3 integration, NFT profiles, decentralized messaging, real-time video calls, AR filters, and blockchain-based content monetization. Built with cutting-edge Flutter technologies.',
      githubUrl: 'https://github.com/MrJabiulla/connecthub-2025',
      demoUrl: 'https://connecthub2025.web.app',
      technologies: ['Flutter', 'Web3', 'Firebase', 'WebRTC', 'Agora', 'Blockchain', 'GetX', 'AR Core'],
      features: [
        'Web3 & NFT Integration',
        'Decentralized Messaging',
        'AR Video Filters',
        'Blockchain Monetization',
        'Real-time Video Calls',
        'Cross-platform Sync',
        'AI Content Moderation',
        'Creator Economy Tools',
      ],
      category: ProjectCategory.mobileApp,
      status: ProjectStatus.inProgress,
      createdDate: DateTime(2024, 11, 10),
      updatedDate: DateTime(2025, 6, 4),
      stars: 156,
      forks: 38,
      isFeatured: true,
      primaryColor: const Color(0xFF6C63FF),
      secondaryColor: const Color(0xFF4A4A4A),
    ),

    Project(
      id: 'ai-taskflow',
      title: 'AI TaskFlow Enterprise',
      shortDescription: 'AI-powered project management with smart automation',
      description: 'Enterprise-grade task management platform with AI-powered project insights, smart task automation, advanced team collaboration, integrated time tracking, and predictive analytics. Features include Kanban boards, Gantt charts, and AI-driven productivity recommendations.',
      githubUrl: 'https://github.com/MrJabiulla/ai-taskflow-enterprise',
      demoUrl: 'https://ai-taskflow.netlify.app',
      appStoreUrl: 'https://apps.apple.com/app/ai-taskflow/id123456789',
      technologies: ['Flutter', 'Supabase', 'AI/ML', 'Provider', 'GraphQL', 'WebSocket', 'Swift'],
      features: [
        'AI Task Automation',
        'Predictive Analytics',
        'Smart Resource Allocation',
        'Advanced Reporting',
        'Team Collaboration Tools',
        'Calendar Integration',
        'API Integrations',
        'Enterprise Security',
      ],
      category: ProjectCategory.mobileApp,
      status: ProjectStatus.completed,
      createdDate: DateTime(2024, 6, 20),
      updatedDate: DateTime(2025, 5, 28),
      stars: 312,
      forks: 89,
      isFeatured: true,
      primaryColor: const Color(0xFF0ACF83),
      secondaryColor: const Color(0xFF1A1A1A),
    ),

    Project(
      id: 'defi-crypto-tracker',
      title: 'DeFi CryptoWatch Pro',
      shortDescription: 'Advanced DeFi portfolio tracker with yield farming',
      description: 'Professional-grade DeFi portfolio management application with real-time price tracking, yield farming optimization, liquidity pool analytics, advanced charting, portfolio rebalancing alerts, and integrated DEX trading capabilities.',
      githubUrl: 'https://github.com/MrJabiulla/defi-cryptowatch-pro',
      demoUrl: 'https://defi-cryptowatch.vercel.app',
      technologies: ['Flutter', 'Web3', 'Riverpod', 'WebSocket', 'DeFi APIs', 'Charts', 'SQLite', 'Blockchain'],
      features: [
        'DeFi Yield Optimization',
        'Multi-chain Support',
        'Advanced Portfolio Analytics',
        'Liquidity Pool Tracking',
        'Automated Rebalancing',
        'DEX Integration',
        'Risk Assessment Tools',
        'Tax Reporting',
      ],
      category: ProjectCategory.mobileApp,
      status: ProjectStatus.completed,
      createdDate: DateTime(2024, 3, 12),
      updatedDate: DateTime(2025, 6, 2),
      stars: 198,
      forks: 52,
      isFeatured: false,
      primaryColor: const Color(0xFFF7931E),
      secondaryColor: const Color(0xFF1E1E2E),
    ),

    Project(
      id: 'flutter-ui-2025',
      title: 'FlutterUI 2025 Toolkit',
      shortDescription: 'Modern UI component library with AI-powered theming',
      description: 'Next-generation UI component library for Flutter featuring 200+ components, AI-powered theme generation, accessibility-first design, micro-animations, and comprehensive design system tools for modern app development.',
      githubUrl: 'https://github.com/MrJabiulla/flutter-ui-2025',
      demoUrl: 'https://flutterui2025.dev',
      technologies: ['Flutter', 'Dart', 'AI/ML', 'Animation API', 'Design System', 'Accessibility', 'Material Design 3'],
      features: [
        'AI Theme Generation',
        '200+ UI Components',
        'Accessibility First',
        'Micro-animations Library',
        'Design System Tools',
        'Code Generation',
        'Figma Integration',
        'Performance Optimized',
      ],
      category: ProjectCategory.library,
      status: ProjectStatus.completed,
      createdDate: DateTime(2024, 1, 8),
      updatedDate: DateTime(2025, 5, 15),
      stars: 445,
      forks: 123,
      isFeatured: false,
      primaryColor: const Color(0xFF42A5F5),
      secondaryColor: const Color(0xFF1565C0),
    ),

    Project(
      id: 'mindful-ai-meditation',
      title: 'MindfulAI Companion',
      shortDescription: 'AI-powered meditation app with personalized sessions',
      description: 'Intelligent meditation and wellness application featuring AI-generated personalized meditation sessions, biometric integration, mood tracking, sleep optimization, guided breathing exercises, and adaptive mindfulness programs.',
      githubUrl: 'https://github.com/MrJabiulla/mindful-ai-companion',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.mrjabiulla.mindfulai',
      appStoreUrl: 'https://apps.apple.com/app/mindfulai/id987654321',
      technologies: ['Flutter', 'AI/ML', 'Firebase', 'HealthKit', 'Audio Processing', 'Bloc', 'Biometrics'],
      features: [
        'AI Personalized Sessions',
        'Biometric Integration',
        'Mood & Sleep Tracking',
        'Adaptive Programs',
        'Voice-guided Sessions',
        'Progress Analytics',
        'Community Features',
        'Offline Content',
      ],
      category: ProjectCategory.mobileApp,
      status: ProjectStatus.completed,
      createdDate: DateTime(2024, 9, 5),
      updatedDate: DateTime(2025, 4, 20),
      stars: 167,
      forks: 34,
      isFeatured: false,
      primaryColor: const Color(0xFF8E24AA),
      secondaryColor: const Color(0xFF4A148C),
    ),

    Project(
      id: 'flutter-backend-toolkit',
      title: 'Flutter Backend Toolkit',
      shortDescription: 'Complete backend solution for Flutter developers',
      description: 'Comprehensive backend toolkit specifically designed for Flutter applications, featuring authentication services, real-time database sync, file storage, push notifications, analytics, and deployment automation.',
      githubUrl: 'https://github.com/MrJabiulla/flutter-backend-toolkit',
      demoUrl: 'https://flutter-backend-toolkit.dev',
      technologies: ['Dart', 'Node.js', 'PostgreSQL', 'Redis', 'Docker', 'Cloud Functions', 'REST API', 'GraphQL'],
      features: [
        'Flutter-first Design',
        'Auto-generated APIs',
        'Real-time Sync',
        'Authentication Service',
        'File Storage System',
        'Push Notifications',
        'Analytics Dashboard',
        'One-click Deployment',
      ],
      category: ProjectCategory.backend,
      status: ProjectStatus.inProgress,
      createdDate: DateTime(2025, 1, 15),
      updatedDate: DateTime(2025, 6, 5),
      stars: 89,
      forks: 21,
      isFeatured: false,
      primaryColor: const Color(0xFF2E7D32),
      secondaryColor: const Color(0xFF1B5E20),
    ),

    Project(
      id: 'swift-flutter-bridge',
      title: 'Swift-Flutter Bridge',
      shortDescription: 'Seamless iOS native integration for Flutter',
      description: 'Advanced development tool that enables seamless integration between Swift native iOS features and Flutter applications, including native UI components, platform channels, and performance optimization tools.',
      githubUrl: 'https://github.com/MrJabiulla/swift-flutter-bridge',
      technologies: ['Swift', 'Flutter', 'iOS SDK', 'Platform Channels', 'Native Modules', 'Objective-C'],
      features: [
        'Native iOS Integration',
        'Platform Channel Generator',
        'UI Component Bridge',
        'Performance Profiler',
        'Memory Management',
        'Debug Tools',
        'Code Templates',
        'Documentation Generator',
      ],
      category: ProjectCategory.tool,
      status: ProjectStatus.planning,
      createdDate: DateTime(2025, 3, 1),
      updatedDate: DateTime(2025, 6, 3),
      stars: 23,
      forks: 7,
      isFeatured: false,
      primaryColor: const Color(0xFFFA7343),
      secondaryColor: const Color(0xFFE65100),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredProjects = _projects;
    _applyFilters();
  }

  void _applyFilters() {
    setState(() {
      _filteredProjects = _projects;

      // Apply category filter
      if (_selectedCategory != 'All') {
        _filteredProjects = _filteredProjects.where((project) =>
        project.category.displayName == _selectedCategory).toList();
      }

      // Sort by featured first, then by update date
      _filteredProjects.sort((a, b) {
        if (a.isFeatured && !b.isFeatured) return -1;
        if (!a.isFeatured && b.isFeatured) return 1;
        return (b.updatedDate ?? b.createdDate)
            .compareTo(a.updatedDate ?? a.createdDate);
      });
    });
  }

  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
    });
    HapticFeedback.lightImpact();
  }

  int get _totalStars => _projects.fold(0, (sum, project) => sum + (project.stars ?? 0));
  int get _totalForks => _projects.fold(0, (sum, project) => sum + (project.forks ?? 0));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _buildBackground(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isDesktop ? 120 : 100,
          horizontal: context.isDesktop ? 80 : 24,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(context),
                const SizedBox(height: 60),
                if (_showFilters) ...[
                  _buildFilterPanel(context),
                  const SizedBox(height: 40),
                ],
                _buildProjectsGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFF8F9FA),
          Color(0xFFE9ECEF),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          'Featured Projects',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: context.isDesktop ? 48 : 36,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 16),

        // Underline
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.secondaryGradient,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        const SizedBox(height: 16),

        // Subtitle
        Text(
          'Innovative mobile applications and development solutions by MrJabiulla • Updated June 2025',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            fontSize: context.isDesktop ? 18 : 16,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 32),

        // Stats and filter toggle
        Wrap(
          spacing: 20,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _buildStatChip('${_filteredProjects.length}', 'Projects'),
            _buildStatChip('$_totalStars', 'GitHub Stars'),
            _buildStatChip('$_totalForks', 'Forks'),
            _buildFilterButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildStatChip(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton() {
    return GestureDetector(
      onTap: _toggleFilters,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _showFilters
                ? [AppColors.secondary, AppColors.secondary.withOpacity(0.8)]
                : [AppColors.surfaceVariant, AppColors.white],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.secondary.withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _showFilters ? Icons.filter_list_off : Icons.filter_list,
              color: _showFilters ? AppColors.white : AppColors.secondary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              _showFilters ? 'Hide Filters' : 'Filter Projects',
              style: TextStyle(
                color: _showFilters ? AppColors.white : AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter by Category',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: ['All', 'Mobile App', 'Web App', 'Backend', 'Library', 'Tool'].map((category) {
              final isSelected = _selectedCategory == category;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedCategory = category);
                  _applyFilters();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.secondary : AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? AppColors.secondary : AppColors.outline,
                    ),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? AppColors.white : AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    if (_filteredProjects.isEmpty) {
      return _buildEmptyState(context);
    }

    if (context.isDesktop) {
      return Wrap(
        spacing: 32,
        runSpacing: 32,
        alignment: WrapAlignment.center,
        children: _filteredProjects.asMap().entries.map((entry) {
          final index = entry.key;
          final project = entry.value;
          return SizedBox(
            width: 400,
            child: _buildProjectCard(context, project, index),
          );
        }).toList(),
      );
    } else {
      return Column(
        children: _filteredProjects.asMap().entries.map((entry) {
          final index = entry.key;
          final project = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildProjectCard(context, project, index),
          );
        }).toList(),
      );
    }
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: 16),
          Text(
            'No projects found',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project, int index) {
    final isHovered = _hoveredCard == index;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _hoveredCard = index);
        HapticFeedback.lightImpact();
      },
      onExit: (_) => setState(() => _hoveredCard = -1),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered
                ? project.primaryColor.withOpacity(0.5)
                : AppColors.outline,
            width: isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? project.primaryColor.withOpacity(0.2)
                  : AppColors.shadow,
              blurRadius: isHovered ? 20 : 12,
              offset: Offset(0, isHovered ? 8 : 4),
              spreadRadius: isHovered ? 2 : 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectImage(project),
              _buildProjectContent(context, project),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage(Project project) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            project.primaryColor,
            project.secondaryColor,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Project image placeholder with icon
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                project.category.icon,
                size: 50,
                color: AppColors.white,
              ),
            ),
          ),

          // Featured badge
          if (project.isFeatured)
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 12,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Status badge
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: project.status.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    project.status.icon,
                    size: 12,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    project.status.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Gradient overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),

          // Category label
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                project.category.displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectContent(BuildContext context, Project project) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and stars
          Row(
            children: [
              Expanded(
                child: Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (project.stars != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xFFFFD700),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${project.stars}',
                        style: const TextStyle(
                          color: Color(0xFFFFD700),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 12),

          // Description
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 16),

          // Technologies
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: project.technologies.take(5).map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: project.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: project.primaryColor.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    color: project.primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Action buttons
          Row(
            children: [
              if (project.githubUrl != null)
                Expanded(
                  child: _buildActionButton(
                    'View Code',
                    Icons.code,
                    AppColors.primary,
                        () => Helpers.launchUrlString(project.githubUrl!),
                  ),
                ),
              if (project.githubUrl != null && (project.demoUrl != null || project.playStoreUrl != null))
                const SizedBox(width: 12),
              if (project.demoUrl != null)
                Expanded(
                  child: _buildActionButton(
                    'Live Demo',
                    Icons.launch,
                    AppColors.secondary,
                        () => Helpers.launchUrlString(project.demoUrl!),
                  ),
                ),
              if (project.playStoreUrl != null)
                Expanded(
                  child: _buildActionButton(
                    'Play Store',
                    Icons.shop,
                    AppColors.success,
                        () => Helpers.launchUrlString(project.playStoreUrl!),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.mediumImpact();
          onTap();
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.white, size: 16),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}