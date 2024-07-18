import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class VoiceRooms extends StatelessWidget {
  const VoiceRooms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      color: ColorApp.mainApp,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 23.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Voice Rooms',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Text('More',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration:
                      const BoxDecoration(color: ColorApp.secondMainApp),
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: ColorApp.secondMainApp),
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: ColorApp.secondMainApp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
