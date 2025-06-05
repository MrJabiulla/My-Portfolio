import 'package:flutter/material.dart';

class Skill {
  final String name;
  final double percentage;
  final String? level;
  final IconData? icon;

  const Skill({
    required this.name,
    required this.percentage,
    this.level,
    this.icon,
  });
}

class Technology {
  final String name;
  final IconData icon;
  final Color color;
  final String category;

  const Technology({
    required this.name,
    required this.icon,
    required this.color,
    required this.category,
  });
}

class AppSkills {
  // Programming Languages & Core Technologies
  static const List<Skill> coreSkills = [
    Skill(name: 'C++', percentage: 95, level: 'Expert', icon: Icons.terminal),
    Skill(name: 'Dart', percentage: 95, level: 'Expert', icon: Icons.code),
    Skill(name: 'Flutter', percentage: 95, level: 'Expert', icon: Icons.flutter_dash),
    Skill(name: 'Swift', percentage: 70, level: 'Learning', icon: Icons.phone_iphone),
    Skill(name: 'Responsive UI/UX', percentage: 90, level: 'Expert', icon: Icons.design_services),
  ];

  // Backend & APIs
  static const List<Skill> backendSkills = [
    Skill(name: 'REST API Implementation', percentage: 92, level: 'Expert', icon: Icons.api),
    Skill(name: 'GraphQL', percentage: 85, level: 'Advanced', icon: Icons.query_stats),
    Skill(name: 'Socket Implementation', percentage: 80, level: 'Advanced', icon: Icons.cable),
    Skill(name: 'Firebase Backend', percentage: 90, level: 'Expert', icon: Icons.local_fire_department),
    Skill(name: 'Supabase', percentage: 85, level: 'Advanced', icon: Icons.storage),
  ];

  // Architecture & State Management
  static const List<Skill> architectureSkills = [
    Skill(name: 'Clean Architecture', percentage: 90, level: 'Expert', icon: Icons.architecture),
    Skill(name: 'MVVM Pattern', percentage: 88, level: 'Advanced', icon: Icons.view_module),
    Skill(name: 'Bloc State Management', percentage: 92, level: 'Expert', icon: Icons.stream),
    Skill(name: 'Provider', percentage: 85, level: 'Advanced', icon: Icons.widgets),
    Skill(name: 'GetX', percentage: 80, level: 'Advanced', icon: Icons.layers),
  ];

  // Payments & Authentication
  static const List<Skill> integrationSkills = [
    Skill(name: 'Stripe Integration', percentage: 88, level: 'Advanced', icon: Icons.payment),
    Skill(name: 'Apple Pay', percentage: 85, level: 'Advanced', icon: Icons.apple),
    Skill(name: 'Google Pay', percentage: 85, level: 'Advanced', icon: Icons.android),
    Skill(name: 'Apple Authentication', percentage: 90, level: 'Expert', icon: Icons.fingerprint),
    Skill(name: 'Google Authentication', percentage: 90, level: 'Expert', icon: Icons.login),
    Skill(name: 'Firebase Authentication', percentage: 92, level: 'Expert', icon: Icons.security),
  ];

  // All skills combined
  static List<Skill> getAllSkills() {
    return [...coreSkills, ...backendSkills, ...architectureSkills, ...integrationSkills];
  }

  // Technology icons with enhanced design
  static const List<Technology> technologies = [
    // Core Technologies
    Technology(name: 'Flutter', icon: Icons.flutter_dash, color: Color(0xFF02569B), category: 'core'),
    Technology(name: 'Dart', icon: Icons.code, color: Color(0xFF0175C2), category: 'core'),
    Technology(name: 'C++', icon: Icons.terminal, color: Color(0xFF00599C), category: 'core'),
    Technology(name: 'Swift', icon: Icons.phone_iphone, color: Color(0xFFFA7343), category: 'core'),

    // Backend & Database
    Technology(name: 'Firebase', icon: Icons.local_fire_department, color: Color(0xFFFFCA28), category: 'backend'),
    Technology(name: 'Supabase', icon: Icons.storage, color: Color(0xFF3ECF8E), category: 'backend'),
    Technology(name: 'GraphQL', icon: Icons.query_stats, color: Color(0xFFE10098), category: 'backend'),
    Technology(name: 'REST API', icon: Icons.http, color: Color(0xFF61DAFB), category: 'backend'),

    // State Management
    Technology(name: 'Bloc', icon: Icons.stream, color: Color(0xFF2196F3), category: 'architecture'),
    Technology(name: 'Provider', icon: Icons.widgets, color: Color(0xFF4CAF50), category: 'architecture'),
    Technology(name: 'GetX', icon: Icons.layers, color: Color(0xFF9C27B0), category: 'architecture'),
    Technology(name: 'MVVM', icon: Icons.view_module, color: Color(0xFF795548), category: 'architecture'),

    // Payments & Auth
    Technology(name: 'Stripe', icon: Icons.payment, color: Color(0xFF635BFF), category: 'integration'),
    Technology(name: 'Apple Pay', icon: Icons.apple, color: Color(0xFF000000), category: 'integration'),
    Technology(name: 'Google Pay', icon: Icons.android, color: Color(0xFF4285F4), category: 'integration'),
    Technology(name: 'Auth', icon: Icons.security, color: Color(0xFFFF5722), category: 'integration'),
  ];
}