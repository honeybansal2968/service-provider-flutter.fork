import 'package:flutter/material.dart';
import 'package:authentication/models/userModel.dart';
import 'package:authentication/authentication/login_or_register_page.dart';
import 'package:authentication/serivces/auth_service.dart';

class MenuScreen extends StatefulWidget {
  final User data;

  const MenuScreen(this.data, {Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {

    final User data = widget.data;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      data.photo),
                ),
                SizedBox(height: 10.0),
                Text(data.fullName),
                SizedBox(height: 20.0),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Home'),
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DrawerScreen(),
                            //     ));
                          }),
                      ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Booking'),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => BookingScreen(),
                            //   ),
                            // );
                          }),
                      ListTile(
                        leading: Icon(Icons.category_sharp),
                        title: Text('Privacy Policy'),
                        onTap: () {
                          // Add onTap logic here
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => PrivacyScreen(),
                          //   ),
                          // );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.branding_watermark),
                        title: Text('Licenses'),
                        onTap: () {
                          // Add onTap logic here
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Licenses(),
                          //   ),
                          // );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.list_sharp),
                        title: Text('Help & Support'),
                        onTap: () {
                          // Add onTap logic here
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Help_Support(),
                          //   ),
                          // );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Log Out'),
                        onTap: () async {
                          await AuthService.logOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginOrRegisterPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 40,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.star),
            ),
          ),
        ],
      ),
    );
  }
}
