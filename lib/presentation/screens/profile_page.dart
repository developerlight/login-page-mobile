import 'package:flutter/material.dart';
import 'setting_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/images/login.jpg'),
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe Brown',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@johndoe',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.red[900]),
                    title: Text('Email'),
                    subtitle: Text('johndoe@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.red[900]),
                    title: Text('Phone'),
                    subtitle: Text('+1 234 567 890'),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red[900]),
                    title: Text('Location'),
                    subtitle: Text('New York, USA'),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today, color: Colors.red[900]),
                    title: Text('Member Since'),
                    subtitle: Text('January 2023'),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.red[900]),
                    title: Text('Password'),
                    subtitle: Text('********'),
                    trailing: TextButton(
                      onPressed: () {
                        // Navigate to change password page
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(color: Colors.red[900]),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.red[900]),
                    title: Text('Settings'),
                    onTap: () {
                      // Navigate to settings page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                    trailing: Icon(Icons.arrow_drop_down),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red[900]),
                    title: Text('Logout'),
                    onTap: () {
                      // Handle logout action
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

