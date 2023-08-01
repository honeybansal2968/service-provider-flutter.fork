import 'package:flutter/material.dart';

class LicensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Licenses'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Third-Party Licenses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Your App Name uses the following third-party libraries:',
            ),
            SizedBox(height: 5),
            // Add a list of third-party libraries and their licenses here
            ListTile(
              title: Text('Library Name 1'),
              subtitle: Text('License: [License Type]'),
              // You can add more information like version number or author
            ),
            ListTile(
              title: Text('Library Name 2'),
              subtitle: Text('License: [License Type]'),
            ),
            // Add more third-party libraries and licenses here
            SizedBox(height: 20),
            Text(
              'Attributions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Your App Name includes resources from the following sources:',
            ),
            SizedBox(height: 5),
            // Add a list of attributions and their sources here
            ListTile(
              title: Text('Resource Name 1'),
              subtitle: Text('Source: [Source URL]'),
              // You can add more information or a clickable link to the source
            ),
            ListTile(
              title: Text('Resource Name 2'),
              subtitle: Text('Source: [Source URL]'),
            ),
            // Add more attributions and sources here
          ],
        ),
      ),
    );
  }
}
