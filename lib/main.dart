import 'package:flutter/material.dart';
import 'package:local_database/Screen/first_screen.dart';
import 'package:local_database/Screen/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  List<String> listname = [];
  List<String> listdes = [];
  void setinit() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', 'Thida');
    await prefs.setString('name', 'Lislis');
    await prefs.setStringList('user', <String>['user1', 'user2', 'user3']);
    await prefs.setStringList(
        'desc', <String>['Hello', 'How are you', 'how old are you?']);
  }

  @override
  void initState() {
    super.initState();
    setinit();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: descontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your name',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    listname.add(controller.text);
                    controller.text = '';
                  });
                },
                child: Text('Save'))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () async {
              var prefs = await SharedPreferences.getInstance();
              await prefs.setStringList('user', listname);
            },
            child: const Icon(Icons.sync),
          ),
          FloatingActionButton(
            onPressed: (() {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return SecondScsreen();
                    }),
                  ),
                );
              });
            }),
            child: const Icon(Icons.forward),
          ),
        ],
      ),
    );
  }
}
