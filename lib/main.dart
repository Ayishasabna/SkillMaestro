import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/admin/add_job_provider.dart';
import 'package:skillmaestro/application/admin/all_experts_list_provider.dart';
import 'package:skillmaestro/application/admin/all_jobs_list_provider.dart';
import 'package:skillmaestro/application/admin/block_user_provider.dart';
import 'package:skillmaestro/application/expert/expert_provider.dart';
import 'package:skillmaestro/application/expert/show_all_jobs_provider.dart';
import 'package:skillmaestro/application/user/user_provider.dart';
import 'package:skillmaestro/common/on_boarding/splash_screen.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';

import 'application/admin/admin_provider.dart';
import 'application/admin/all_users_list_provider.dart';
import 'application/common/common_provider.dart';
import 'application/expert/expert_profile_provider.dart';
import 'application/user/get_jobs_provider.dart';
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
        ListenableProvider(create: (context) => AllExpertListForAdmin()),
        ListenableProvider(create: (context) => AllUsersListProvider()),
        ListenableProvider(create: (context) => ExpertProvider()),
        ListenableProvider(create: (context) => AllJobsListForAdmin()),
        ListenableProvider(create: (context) => AddJobProvider()),
        ListenableProvider(create: (context) => ExpertProfileProvider()),
        ListenableProvider(create: (context) => ShowAllJobsProvider()),
        ListenableProvider(create: (context) => AlljobsListForUser()),
        ListenableProvider(create: (context) => BlockUserProvider())
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
