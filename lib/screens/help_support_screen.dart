import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Support'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Add a list of frequently asked questions and their answers here
            // You can use ExpansionTile or ListTile widgets to create collapsible questions/answers.
            // Example:
            ExpansionTile(
              title: Text('How do I reset my password?'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('To reset your password, go to the login screen and click on the "Forgot Password" link. Follow the instructions to reset your password.'),
                ),
              ],
            ),
            // Add more FAQs here
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any other questions or need further assistance, please feel free to contact our support team:',
            ),
            SizedBox(height: 5),
            // Provide your support contact information here (e.g., email address, phone number)
            Text(
              'Email: support@example.com',
            ),
            // You can add other contact information like phone number, website, etc.
          ],
        ),
      ),
    );
  }
}
