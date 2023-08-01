import 'package:authentication/screens/help_support_screen.dart';
import 'package:authentication/screens/licenses_screen.dart';
import 'package:authentication/screens/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:authentication/models/userModel.dart';
import 'package:authentication/authentication/login_or_register_page.dart';
import 'package:authentication/serivces/auth_service.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'booking_tab_2.dart';

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
                const SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      data.photo),
                ),
                const SizedBox(height: 10.0),
                Text(data.fullName),
                const SizedBox(height: 20.0),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Home'),
                          onTap: () {
                            if (ZoomDrawer.of(context)!.isOpen()) {
                              ZoomDrawer.of(context)!.close();
                            } else {
                              ZoomDrawer.of(context)!.open();
                            }
                          },),
                      ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Booking'),
                          onTap: () {

                            Get.to(BookingPage());
                          }),
                      ListTile(
                        leading: const Icon(Icons.category_sharp),
                        title: const Text('Privacy Policy'),
                        onTap: () {
                          Get.to(PrivacyPolicyPage());

                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.branding_watermark),
                        title: const Text('Licenses'),
                        onTap: () {
                          Get.to(LicensesPage());
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.list_sharp),
                        title: const Text('Help & Support'),
                        onTap: () {
                          Get.to(HelpAndSupportPage());

                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Log Out'),
                        onTap: () async {
                          await AuthService.logOut();
                          Get.offAll(() => const LoginOrRegisterPage());

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
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.star),
            ),
          ),
        ],
      ),
    );
  }
}
