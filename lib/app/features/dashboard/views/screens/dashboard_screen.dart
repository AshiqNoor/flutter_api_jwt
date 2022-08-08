import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/config/routes/routing.dart';
import 'package:flutter_api_jwt/app/constants/app_constants.dart';
import 'package:flutter_api_jwt/app/ui/ui_utils.dart';
import 'package:flutter_api_jwt/app/utils/services/service.dart';
import 'package:provider/provider.dart';
part '../../provider/dashboard_provider.dart';
part '../../model/user_profile_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardProvider>().getuserprofile();
    });
    return Consumer<DashboardProvider>(builder: (context, c, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  c.signOut();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Image.asset(ImagePath.logo, width: 300, height: 60),
              Text(
                c.token,
                style: const TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                  onPressed: () {
                    c.getuserprofile();
                  },
                  child: const Text("Refresh")),
              Visibility(
                //visible: c.data2.isNotEmpty,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: c.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: c.data.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              if (c.data[index].pstatus == "active") {
                                c.isActive = true;
                              } else {
                                c.isActive = false;
                              }
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Card(
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        backgroundImage:
                                            AssetImage(ImagePath.logo),
                                      ),
                                      title: Row(
                                        children: [
                                          Text(c.data[index].pname.toString()),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Icon(Icons.circle,
                                                size: 10,
                                                color: c.isActive
                                                    ? Colors.green
                                                    : Colors.red),
                                          )
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(c.data[index].pcat.toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                  ),
                ),
              )
            ],
          ));
    });
  }
}
