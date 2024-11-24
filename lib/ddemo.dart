import 'package:flutter/material.dart';

class ResponsiveScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
        actions: [
          if (MediaQuery.of(context).size.width > 600) ...[
            // Navigation options for larger screens
            TextButton(
              onPressed: () => _scrollToSection(context, 'AboutMe'),
              child: Text('About Me', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Skills'),
              child: Text('Skills', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Portfolio'),
              child: Text('Portfolio', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Contact'),
              child: Text('Contact', style: TextStyle(color: Colors.white)),
            ),
          ]
        ],
      ),
      drawer: MediaQuery.of(context).size.width <= 600
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text('About Me'),
              onTap: () => _scrollToSection(context, 'AboutMe'),
            ),
            ListTile(
              title: Text('Skills'),
              onTap: () => _scrollToSection(context, 'Skills'),
            ),
            ListTile(
              title: Text('Portfolio'),
              onTap: () => _scrollToSection(context, 'Portfolio'),
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () => _scrollToSection(context, 'Contact'),
            ),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildAboutMe(),
            _buildSkills(),
            _buildPortfolio(),
            _buildContact(),
          ],
        ),
      ),
    );
  }

  // Example scroll-to-section function (implement this based on your structure)
  void _scrollToSection(BuildContext context, String sectionId) {
    // Logic to scroll to a specific section in your layout
    print('Scrolling to section: $sectionId');
  }

  // Dummy widgets for sections
  Widget _buildHeader(BuildContext context) => Container(height: 200, color: Colors.red);
  Widget _buildAboutMe() => Container(height: 200, color: Colors.green);
  Widget _buildSkills() => Container(height: 200, color: Colors.blue);
  Widget _buildPortfolio() => Container(height: 200, color: Colors.orange);
  Widget _buildContact() => Container(height: 200, color: Colors.purple);
}

void main() {
  runApp(MaterialApp(
    home: ResponsiveScaffold(),
  ));
}
