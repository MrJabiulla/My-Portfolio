import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extentions.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_string.dart';
import '../widgets/enhanced_navbar.dart';
import '../widgets/hero_sections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, GlobalKey> _sectionKeys = {
    'hero': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  String _activeSection = 'hero';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Determine which section is currently visible
    final scrollOffset = _scrollController.offset;
    String newActiveSection = 'hero';

    _sectionKeys.forEach((section, key) {
      if (key.currentContext != null) {
        final box = key.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);

        if (position.dy <= 100 && position.dy + box.size.height > 100) {
          newActiveSection = section;
        }
      }
    });

    if (newActiveSection != _activeSection) {
      setState(() {
        _activeSection = newActiveSection;
      });
    }
  }

  void _scrollToSection(String section) {
    if (section == 'hero') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      return;
    }

    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use web navbar for desktop, mobile appbar for mobile
      appBar: context.isDesktop
          ? EnhancedWebNavbar(
        onNavigate: _scrollToSection,
        activeSection: _activeSection,
      )
          : _buildMobileAppBar(),

      drawer: context.isMobile ? _buildDrawer() : null,

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero section with key
            Container(
              key: _sectionKeys['hero'],
              child: HeroSection(onNav: _scrollToSection),
            ),

            // Placeholder sections - will be replaced with actual sections
            Container(
              key: _sectionKeys['about'],
              height: 600,
              color: AppColors.background,
              child: const Center(
                child: Text('About Section - Coming Next!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              key: _sectionKeys['skills'],
              height: 600,
              color: Colors.grey[100],
              child: const Center(
                child: Text('Skills Section - Coming Next!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              key: _sectionKeys['projects'],
              height: 600,
              color: AppColors.background,
              child: const Center(
                child: Text('Projects Section - Coming Next!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              key: _sectionKeys['contact'],
              height: 600,
              color: Colors.grey[100],
              child: const Center(
                child: Text('Contact Section - Coming Next!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildMobileAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: const Text(AppStrings.appName),
      titleTextStyle: const TextStyle(color: AppColors.white),
      iconTheme: const IconThemeData(color: AppColors.white),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'IJ',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ismail Jabiulla',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Portfolio',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(AppStrings.navAbout, 'about', Icons.person),
          _buildDrawerItem(AppStrings.navSkills, 'skills', Icons.code),
          _buildDrawerItem(AppStrings.navProjects, 'projects', Icons.work),
          _buildDrawerItem(AppStrings.navContact, 'contact', Icons.contact_mail),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(String title, String section, IconData icon) {
    final isActive = _activeSection == section;

    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? AppColors.secondary : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.secondary : AppColors.textPrimary,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isActive,
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(section);
      },
    );
  }
}