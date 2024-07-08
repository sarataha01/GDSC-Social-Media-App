import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/colors.dart';
import 'package:gdsc_social_media_app/screens/login%20screen/login_page.dart';

import 'screens/home screen/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorApp.secondMainApp,
      ),
      routes: {
        '/Login': (context) => const LoginPage(),
        '/Homepage': (context) => const HomePage(),
      },
      initialRoute: '/Homepage',
    );
  }
}
