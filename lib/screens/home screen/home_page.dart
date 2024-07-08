import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/screens/login%20screen/components/app_name.dart';

import 'widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        title: AppName(),
      ),
    );
  }
}
