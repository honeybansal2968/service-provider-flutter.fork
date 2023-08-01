import 'package:authentication/authentication/login_or_register_page.dart';
import 'package:authentication/home/booking_tab_2.dart';
import 'package:authentication/home/main_application_page.dart';
import 'package:authentication/provider/mechanic_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'home/all_parts_integrated.dart';
import 'home/home_tab_1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

      debugShowCheckedModeBanner: false,
      home: IntegratedHome(),
    );
  }
}
