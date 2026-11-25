import 'package:material_ui/material_ui.dart';
import '../widget/notification_widget.dart'; // <-- Make sure this path matches where your widget is

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: 20, // <-- This generates exactly 20 notifications
        itemBuilder: (context, index) {
          return Column(
            children: [
              NotificationWidget(
                name: 'User ${index + 1}',
                post: 'Sample Post ${index + 1}',
                description: 'reacted to your post',
              ),
              const Divider(height: 1), // Adds a thin line between notifications
            ],
          );
        },
      ),
    );
  }
}