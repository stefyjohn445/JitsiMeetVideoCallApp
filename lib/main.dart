import 'package:flutter/material.dart';
import 'join_meeting_screen.dart'; // Assuming your file is named join_meeting_screen.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jitsi Meeting App',
      home: JoinMeetingScreen(),
    );
  }
}
