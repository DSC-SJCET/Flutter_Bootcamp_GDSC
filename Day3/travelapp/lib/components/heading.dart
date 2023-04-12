import 'package:flutter/material.dart';
import '../styles.dart';

class HeadingSection extends StatelessWidget {
  const HeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome',
                  // style: p1
                ), //fs14
                Text(
                  'Spellthorn',
                  // style: heading3,//fs16
                )
              ],
            ),
          ],
        ),
        Icon(Icons.notifications, color: icon, size: 28)
      ],
    );
  }
}
