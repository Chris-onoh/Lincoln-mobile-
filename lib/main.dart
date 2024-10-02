import 'package:flutter/material.dart';
import 'screens/results.dart';
import 'screens/profile.dart';
import 'screens/inbox.dart';
import 'screens/announcement.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with the SplashScreen
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String userName = 'John Doe'; // Example user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 8.0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $userName',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Notification button functionality
            },
          ),
        ],
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      drawer: _buildDrawer(context),
      body: _buildAnnouncementFeed(),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              image: DecorationImage(
                image: AssetImage("assets/images/drawer_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.school,
            text: 'Results',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultsPage()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.announcement,
            text: 'Announcements',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.payment,
            text: 'Payments',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.person,
            text: 'Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.redAccent),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildAnnouncementFeed() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 3, // Example count for announcements
      itemBuilder: (BuildContext context, int index) {
        return _buildAnnouncementCard(context);
      },
    );
  }

  Widget _buildAnnouncementCard(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Announcement Topic',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '2h ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'This is a brief description of the announcement...',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnnouncementPage(),
                      ),
                    );
                  },
                  child: const Text('See More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BottomAppBar _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.redAccent,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              iconSize: 28.0,
              onPressed: () {
                setState(() {});
              },
            ),
            IconButton(
              icon: const Icon(Icons.message, color: Colors.white),
              iconSize: 28.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InboxPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
