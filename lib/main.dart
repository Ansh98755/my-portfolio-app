import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: PortfolioScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade800, Colors.pink.shade400, Colors.orange.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              profileSection(),
              const SizedBox(height: 40),
              infoSection(context),
              const SizedBox(height: 50),
              aboutMeSection(),
              const Spacer(),
              footerSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/default_profile.png"),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ayush Mehendiratta",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Roboto",
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                "Software Developer",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.yellowAccent,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          infoRow(Icons.school, "B.Tech in CSE", Colors.cyanAccent),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectsScreen()),
              );
            },
            child: infoRow(Icons.folder, "Projects", Colors.limeAccent),
          ),
          infoRow(Icons.email, "ayushmehendiratta3390@gmail.com", Colors.amberAccent),
          infoRow(Icons.phone, "+91 8630847107", Colors.lightGreenAccent),
          infoRow(Icons.location_pin, "India", Colors.tealAccent),
        ],
      ),
    );
  }

  Widget infoRow(IconData icon, String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutMeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "🚀 AI-Powered Mobile App Developer | Flutter & Kotlin Enthusiast | UI/UX Designer | Building Smart & Scalable Solutions 🔥 Let’s Innovate!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }

  Widget footerSection() {
    return Text(
      "✨ Created By Dhruv ✨",
      style: TextStyle(
        color: Colors.white70,
        fontSize: 14,
        fontFamily: "Roboto",
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  final List<String> projects = [
    "Sahayak: Hospital Bed Booking App",
    "AI Mood Tracker & Companion",
    "Portfolio Maker App",
    "Attendance Automation using Face Recognition",
    "Iris Flower Detection App",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projects"),
        backgroundColor: Colors.purple.shade800,
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.build, color: Colors.purple.shade800),
              title: Text(projects[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectDetailScreen(projectName: projects[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProjectDetailScreen extends StatelessWidget {
  final String projectName;
  ProjectDetailScreen({required this.projectName});

  // Project details map with multiple widgets (Text, Image, Links)
  final Map<String, List<Widget>> projectDetails = {
    "Sahayak: Hospital Bed Booking App": [
      Text(
        "Sahayak is a hospital bed booking and appointment scheduling app that streamlines healthcare access.",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Text(
        "Features:\n✔ Reduces wait times by 40%\n✔ Real-time bed availability\n✔ Appointment booking\n✔ Secure authentication with Firebase & Google Sign-In",
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 15),
      Image.asset("assets/images/sahayak1.jpg"), // Local Image
      Image.asset("assets/images/sahayak2.jpg"), // Local Image
      Image.asset("assets/images/sahayak3.jpg"), // Local Image
      Image.asset("assets/images/sahayak4.jpg"), // Local Image
      Image.asset("assets/images/sahayak.jpg"), // Local Image

      SizedBox(height: 15),
      linkButton("View on GitHub", "https://github.com/Ansh98755/sahayak"),
    ],

    "AI Mood Tracker & Companion": [
      Text(
        "AI Mood Tracker analyzes facial expressions and voice tone to provide emotional insights.",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Text(
        "Features: ✔ 90% accuracy in mood detection\n✔ Personalized recommendations\n✔ Interactive mood insights \n✔Engaging UI & reward system for better mental health",
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 15),
      Image.asset("assets/images/mood.jpg"),
      Image.asset("assets/images/mood1.jpg"),
      Image.asset("assets/images/mood2.jpg"),
      Image.asset("assets/images/mood3.jpg"),
      Image.asset("assets/images/mood4.jpg"),

      SizedBox(height: 15),
      linkButton("View on Github", "https://github.com/Ansh98755/Expression-Detection-APP.git"),
    ],
    "Portfolio Maker App":[
      Text(
        "Build Stunning Portfolios with Ease! 🚀",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Text(
        "Features:\n✔ Made with Flutter for a smooth & fast experience \n✔ Created portfolio in minutes\n✔ User-friendly UI for effortless design",
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 15),
      linkButton("View on Github", "https://github.com/Ansh98755/my-portfolio-app.git"),
    ],
    "Attendance Automation using Face Recognition":[
      Text(
        "Features:\n✔ AI-powered face detection for accurate attendance tracking\n✔ Eliminates proxies & manual errors\n✔ Fast, secure & efficient authentication \n✔ Seamless integration for schools & workplaces",
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 15),
      Image.asset("assets/images/face.png"),
      Image.asset("assets/images/face2.png"),
      Image.asset("assets/images/face3.png"),
      Image.asset("assets/images/face4.png"),
      Image.asset("assets/images/face5.png"),
      Image.asset("assets/images/face6.png"),
      Image.asset("assets/images/face.7png"),
      Image.asset("assets/images/face8.png"),
      SizedBox(height: 15),
      linkButton("View on Github", "https://github.com/Ansh98755/Face_Recognition_System.git"),
    ],

  };

  // Function to create clickable link buttons
  static Widget linkButton(String text, String url) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontSize: 16, decoration: TextDecoration.underline),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Allows scrolling for long content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: projectDetails[projectName] ?? [Text("No details available.")],
          ),
        ),
      ),
    );
  }
}
