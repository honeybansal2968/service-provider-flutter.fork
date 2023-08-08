import 'package:authentication/Profile/profile.dart';
import 'package:authentication/home/booking_tab_2.dart';
import 'package:authentication/home/order_page.dart';
import 'package:authentication/home/home_tab_1.dart';
import 'package:authentication/models/userModel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainApplication extends StatefulWidget {
  const MainApplication( {super.key});

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  final List<Widget> _screens = [
    HomePage(),
    BookingPage(),
    OrderDetailsPage(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const Icon(Icons.menu, color: Colors.black54),
        ),
        title: Text(
          "HELPY MOTO",
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.bold, // adds bold styling
            fontSize: 22.0, // changes font size
            letterSpacing: 1.5, // increases letter spacing
            // fontFamily:
            //     'YourCustomFont', // replace 'YourCustomFont' with your desired font family
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.notifications, color: Colors.blue),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue,
        height: 50,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.speaker_notes_sharp, size: 30),
          Icon(Icons.receipt_outlined, size: 30),
          Icon(Icons.person_sharp, size: 30),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
