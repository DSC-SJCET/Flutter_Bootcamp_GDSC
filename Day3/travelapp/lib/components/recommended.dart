import 'package:flutter/material.dart';
import '../styles.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommended',
          // style: heading1,//fs20 w600 color: heading
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: destinations.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(26),
                  image: DecorationImage(
                    image: AssetImage('assets/images/$index.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 200,
                margin: const EdgeInsets.only(right: 30),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(destinations[index]), //fs18
                            const Text(
                              'location',
                            ), //fs10
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
