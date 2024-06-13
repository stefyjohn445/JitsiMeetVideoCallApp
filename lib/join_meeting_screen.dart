import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';

class JoinMeetingScreen extends StatefulWidget {
  @override
  _JoinMeetingScreenState createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  final _serverURL =
      "https://meet.jit.si"; // Replace with your Jitsi Meet server URL
  final _roomController = TextEditingController();

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
      onConferenceWillJoin: _onConferenceWillJoin,
      onConferenceJoined: _onConferenceJoined,
      onConferenceTerminated: _onConferenceTerminated,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
    JitsiMeet.closeMeeting(); // Correct method to close the meeting
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Jitsi Meeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _roomController,
              decoration: InputDecoration(
                labelText: 'Room Name',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _joinMeeting,
              child: Text('Join Meeting'),
            ),
          ],
        ),
      ),
    );
  }

  void _joinMeeting() async {
    final room = _roomController.text;
    if (room.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Room name cannot be empty')),
      );
      return; // Handle empty room name
    }

    try {
      final options = JitsiMeetingOptions(room: room)
        ..serverURL = _serverURL
        ..subject = "Meeting Subject (Optional)"; // Optional meeting subject

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error joining meeting: $error')),
      );
    }
  }

  void _onConferenceWillJoin(message) {
    print("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    print("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    print("_onConferenceTerminated broadcasted with message: $message");
  }
}
