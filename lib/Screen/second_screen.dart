import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScsreen extends StatefulWidget {
  const SecondScsreen({Key? key}) : super(key: key);
  @override
  State<SecondScsreen> createState() => _SecondScsreenState();
}

class _SecondScsreenState extends State<SecondScsreen> {
  String name = '';
  List<String> list = [];
  List<String> desc = [];
  getName() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      list = prefs.getStringList('user') ?? [];
      //print(list);
    });
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  title: Text(list[index]),
                ),
              );
            })));
  }
}
