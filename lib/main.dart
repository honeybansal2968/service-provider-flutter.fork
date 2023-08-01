import 'package:authentication/authentication/login_or_register_page.dart';
import 'package:authentication/provider/mechanic_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'home/all_parts_integrated.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MechanicDataProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //debugShowCheckedModeBanner: false,
      home: LoginOrRegisterPage(),
    );
  }
}
