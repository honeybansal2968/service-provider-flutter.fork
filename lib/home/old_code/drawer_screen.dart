import 'package:authentication/home/main_application_page.dart';
import 'package:authentication/home/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: MenuScreen(),
      mainScreen: MainApplication(),
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      moveMenuScreen: false,
    );
  }
}
