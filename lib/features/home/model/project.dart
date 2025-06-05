import 'package:flutter/material.dart';

class Project {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final String imageUrl;
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
    required this.imageUrl,
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

  Color get color {
    switch (this) {
      case ProjectCategory.mobileApp:
        return const Color(0xFF4CAF50);
      case ProjectCategory.webApp:
        return const Color(0xFF2196F3);
      case ProjectCategory.backend:
        return const Color(0xFF9C27B0);
      case ProjectCategory.library:
        return const Color(0xFFFF9800);
      case ProjectCategory.tool:
        return const Color(0xFF607D8B);
      case ProjectCategory.game:
        return const Color(0xFFE91E63);
      case ProjectCategory.other:
        return const Color(0xFF795548);
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