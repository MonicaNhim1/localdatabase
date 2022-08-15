import 'package:flutter/material.dart';
import 'package:local_database/Screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key, required this.shownum}) : super(key: key);
  int shownum = 0;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text('Show your Num : ${widget.shownum}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) {
                  return const SecondScsreen();
                }),
              ),
            );
          });
        }),
        child: const Icon(Icons.forward),
      ),
    );
  }
}
