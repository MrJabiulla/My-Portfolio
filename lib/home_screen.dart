import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Portfolio'),
        actions: [
          if (MediaQuery.of(context).size.width > 600) ...[
            TextButton(
              onPressed: () => _scrollToSection(context, 'AboutMe'),
              child:
                  const Text('About Me', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Skills'),
              child:
                  const Text('Skills', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Portfolio'),
              child: const Text('Portfolio',
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Contact'),
              child:
                  const Text('Contact', style: TextStyle(color: Colors.white)),
            ),
          ]
        ],
      ),
      drawer: MediaQuery.of(context).size.width <= 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Menu', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    title: const Text('About Me'),
                    onTap: () => _scrollToSection(context, 'AboutMe'),
                  ),
                  ListTile(
                    title: const Text('Skills'),
                    onTap: () => _scrollToSection(context, 'Skills'),
                  ),
                  ListTile(
                    title: const Text('Portfolio'),
                    onTap: () => _scrollToSection(context, 'Portfolio'),
                  ),
                  ListTile(
                    title: const Text('Contact'),
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

  Widget _buildHeader(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    if (!isDesktop) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/profile.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                    Colors.black,
                  ],
                  stops: const [0.4, 0.8, 1.0],
                ),
              ),
            ),
            // Content
            Positioned(
              left: 20,
              right: 20,
              bottom: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hi, I am',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tomasz Gajda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Front-end Developer / UI Designer',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildSocialIcon(Icons.alternate_email),
                      _buildSocialIcon(Icons.code),
                      _buildSocialIcon(Icons.link),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 500,
      color: Colors.black,
      child: Row(
        children: [
          // Left Content Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hi, I am',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tomasz Gajda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Front-end Developer / UI Designer',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildSocialIcon(Icons.alternate_email),
                      _buildSocialIcon(Icons.code),
                      _buildSocialIcon(Icons.link),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Right Image Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black, Colors.grey.shade900],
                ),
              ),
              child: Center(
                child: Container(
                  // width: 300,
                  // height: 300,
                  decoration: const BoxDecoration(
                    // shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/desktop_profile.png'), // Add your image here
                      // fit: BoxFit.cover,
                    ),
                    // border: Border.all(
                    //   color: Colors.white.withOpacity(0.1),
                    //   width: 2,
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {},
      ),
    );
  }

  Widget _buildAboutMe() {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          const Text(
            'ABOUT ME',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;
              return Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  _buildServiceCard(
                    'DESIGN',
                    'Design services description',
                    isDesktop,
                  ),
                  _buildServiceCard(
                    'DEVELOPMENT',
                    'Development services description',
                    isDesktop,
                  ),
                  _buildServiceCard(
                    'MAINTENANCE',
                    'Maintenance services description',
                    isDesktop,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String description, bool isDesktop) {
    return Container(
      width: isDesktop ? 300 : double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(description),
        ],
      ),
    );
  }

  Widget _buildSkills() {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SKILLS',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          _buildSkillSection('USING NOW:', [
            'HTML5',
            'CSS3',
            'SASS',
            'JavaScript',
            'React',
            'Bootstrap',
            'Git',
            'Figma'
          ]),
          const SizedBox(height: 20),
          _buildSkillSection(
              'LEARNING:', ['Node.js', 'MySQL', 'MongoDB', 'TypeScript']),
          const SizedBox(height: 20),
          _buildSkillSection(
              'OTHER SKILLS:', ['English', 'Spanish', 'Google', 'C']),
        ],
      ),
    );
  }

  Widget _buildSkillSection(String title, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: skills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget _buildPortfolio() {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          const Text(
            'PORTFOLIO',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: isDesktop ? 3 : 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(
                  6,
                  (index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // Add portfolio images here
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContact() {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          const Text(
            'CONTACT',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          _buildContactForm(),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('SUBMIT'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(BuildContext context, String sectionId) {
    // Logic to scroll to a specific section in your layout
    print('Scrolling to section: $sectionId');
  }
}
