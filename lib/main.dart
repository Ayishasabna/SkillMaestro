import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/user/user_provider.dart';
import 'package:skillmaestro/common/on_boarding/splash_screen.dart';

import 'application/admin/admin_provider.dart';
import 'application/common/common_provider.dart';
import 'common/on_boarding/first_screen.dart';

//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => UserProvider()),
        ListenableProvider(create: (context) => AdminProvider()),
        ListenableProvider(
          create: (context) => CommonProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skill Maestro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
