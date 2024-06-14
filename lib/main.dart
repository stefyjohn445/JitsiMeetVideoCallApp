import 'package:flutter/material.dart';
import 'package:my_jitsi_app/join_meeting_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jitsi Meeting App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/joinMeeting': (context) => JoinMeetingScreen(), // Define the route
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Consultation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/doctor.png', // Update with your image path
              height: 200,
            ),
            SizedBox(height: 20.0),
            Text(
              'Live talk with doctors',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'You can have a live talk with our experienced doctors to get medical advice and consultation.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            // Spacer(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // JoinMeetingScreen();
                Navigator.pushNamed(context, '/joinMeeting');
                // Handle call button press
              },
              child: Text('Video Call'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                textStyle: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
