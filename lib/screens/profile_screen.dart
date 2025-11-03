import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/user_avatar.jpeg'),
          ),
          SizedBox(height: 20),
          Text("Your Name", style: TextStyle(fontSize: 24)),
          Text("ashish.email@example.com"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "I am a passionate movie enthusiast who loves exploring different genres and sharing my thoughts on films. In my free time, I enjoy watching classic movies and discovering hidden gems. My favorite genres include sci-fi, drama, and comedy. My favorite shows are Friends, Stranger Things, and The Office.",
            ),
          ),
        ],
      ),
    );
  }
}
