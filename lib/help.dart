import 'package:flutter/material.dart';
import 'login.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              "How to use the Application",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30),
          buildMenu('Profile', [
            'Consists of group member profiles',
            "Swipe the screen to view each member's profile",
            'Tap Details to see detailed information about each member',
          ]),
          buildMenu('Stopwatch', [
            'To start the stopwatch, tap the Start button',
            'To pause the stopwatch, tap the Pause button',
            'To reset the stopwatch, tap the Reset button',
          ]),
          buildMenu('Favorite', [
            'To add an item to your favorites, tap the Love button',
            'To remove an item from your favorites, tap again the Love button',
            'To view your favorites, tap the Favorite at Dashboard Menu',
          ]),
          buildMenu('Website', [
            'To open the detail Tags, tap the Tags',
            'To open the detail Categories, tap the Categories',
            'To open the Website, tap the Launch button',
          ]),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              ),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPageState()));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Logged out successfully"),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenu(String title, List<String> items) {
    return ExpansionTile(
      title: Text(title),
      children: items.map((item) => ListTile(title: Text(item))).toList(),
    );
  }
}
