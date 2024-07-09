import 'package:flutter/material.dart';

import 'widgets/custom_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const MySliverAppBar(
            height: 70,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
