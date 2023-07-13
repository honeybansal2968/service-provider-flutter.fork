import 'package:flutter/material.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  bool _isNotificationsEnabled = true;
  final double _notificationVolume = 0.5;
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final cardHeight = screenHeight * 0.15;
    final cardWidth = screenWidth * 0.9;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: cardHeight,
                width: cardWidth,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SwitchListTile(
                    title: const Text(
                      'Notifications Enabled',
                    ),
                    value: _isNotificationsEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _isNotificationsEnabled = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: cardHeight,
                width: cardWidth,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    title: const Text('Notification Volume'),
                    subtitle: Text('${(_notificationVolume * 100).toInt()}%'),
                    // trailing: Slider(
                    //   value: _notificationVolume,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       _notificationVolume = newValue;
                    //     });
                    //   },
                    // ),
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: cardHeight,
                width: cardWidth,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: _isDarkModeEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _isDarkModeEnabled = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
            //Expanded(child: Container()),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
    );
  }
}
