import 'package:flutter/material.dart';

class CancelledJobs extends StatelessWidget {
  const CancelledJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('No Cancelled Jobs')),
    );
  }
}
