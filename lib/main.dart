import 'package:doctor_appointment_app/provider/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "poppins"),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BottomNavigationBarController(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
