import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Portfolio'),
        titleTextStyle: TextStyle(color: Colors.white),
        actions: [
          if (MediaQuery.of(context).size.width > 600) ...[
            TextButton(
              onPressed: () => _scrollToSection(context, 'Portfolio'),
              child:
                  const Text('Portfolio', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Skills'),
              child:
                  const Text('Skills', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'Experience'),
              child: const Text('Experience',
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _scrollToSection(context, 'AboutMe'),
              child: const Text('About Me',
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
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
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

    return isDesktop ?
    Container(
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
                  const SizedBox(height: 0),
                  const Text(
                    'Ismail Jabiulla',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Software Engineer - Mobile Application',
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
    )
        : Container(
      height: MediaQuery.of(context).size.height - 55,
      child: Stack(
        children: [
          // Image Carousel
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height - 55,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: false,
            ),
            items: [
              'assets/profile.png',
              'assets/profile2.png',
              'assets/profile3.png',
            ].map((imagePath) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              );
            }).toList(),
          ),
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
                  'Ismail Jabiulla',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Software Engineer - Mobile Application',
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
    ;
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
          Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'ABOUT ME',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _buildServiceCard(
                  //   'DESIGN',
                  //   'Design services description',
                  //   isDesktop,
                  // ),
                  _buildServiceCard(
                    'DEVELOPMENT',
                    "I am a passionate mobile app developer with over two years of experience specializing in Flutter.\nI have delivered and published several client projects on the Play Store and App Store, integrating payment systems like Stripe. My expertise includes debugging, testing, and maintaining apps to ensure optimal performance. I specialize in bug fixing, REST APIs, real-time communication, and notifications through socket integration. I also have strong experience with Firebase authentication. Skilled in manual and automated testing, including unit and integration tests, I ensure smooth app functionality. I handle app updates, feature enhancements, and long-term maintenance to maintain performance. With experience in VPN apps, I continue to enhance my Flutter skills and explore Swift. I am also focused on improving my English communication for effective global collaboration.",
                    isDesktop,
                    context
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String description, bool isDesktop, context) {
    return Container(
      width: isDesktop ? MediaQuery.of(context).size.width*0.90 : double.infinity,
      // padding: const EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      child: Column(
        children: [
          // Text(
          //   title,
          //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
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
            'Dart',
            'Flutter',
            'REST APIs',
            'Firebase',
            'Git',
            'Figma',
            'Socket.io',
            'Stripe',
          ]),
          const SizedBox(height: 20),
          _buildSkillSection(
              'LEARNING:', ['Swift', 'Kotlin', 'Node.js', 'MongoDB']),
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
