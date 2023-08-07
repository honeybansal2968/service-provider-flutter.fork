import 'package:authentication/home/main_application_page.dart';
import 'package:authentication/home/menu_screen.dart';
import 'package:authentication/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class IntegratedHome extends StatefulWidget {
  final User data;

  const IntegratedHome(this.data, {Key? key}) : super(key: key);

  @override
  State<IntegratedHome> createState() => _IntegratedHomeState();
}

class _IntegratedHomeState extends State<IntegratedHome> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    final User data = widget.data;

    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: MenuScreen(data),
      mainScreen: const MainApplication(),
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      moveMenuScreen: false,
    );
  }
}
