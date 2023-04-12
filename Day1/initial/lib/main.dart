import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: const Color.fromARGB(234, 188, 188, 188),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: Text(mycontroller.text)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: const Icon(Icons.location_pin),
        ),
        body: Center(
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
              hintText: 'Enter Your Name',
            ),
            controller: mycontroller,
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
