import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/services/user_services.dart';

import '../../../core/constants/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: ColorApp.mainApp,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () async {
                  await UserServices.getAllInfo(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Log out'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/Login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
