import 'dart:convert';

import 'package:flutter/material.dart';
part '../../provider/dashboard_provider.dart';
part '../../model/user_profile_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: const Center(child: Text("Dashboard")),
        ),
      ),
    );
  }
}
