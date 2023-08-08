import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      id: 1,
      title: 'New Message',
      content: 'You have received a new message.',
    ),
    NotificationItem(
      id: 2,
      title: 'Reminder',
      content: 'Don\'t forget the meeting at 3 PM.',
    ),
    // Add more notifications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Notification List'),
          ),
          body: ListView.separated(
            itemCount: notifications.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return Dismissible(
                key: ValueKey(notification.id),
                onDismissed: (direction) {
                  setState(() {
                    notifications.removeAt(index);
                  });
                  Get.snackbar(
                    'Notification Dismissed',
                    'Notification has been dismissed.',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(notification.title),
                  subtitle: Text(notification.content),
                ),
              );
            },
          ),
        ),

    );
  }
}

class NotificationItem {
  final int id;
  final String title;
  final String content;

  NotificationItem({
    required this.id,
    required this.title,
    required this.content,
  });
}
