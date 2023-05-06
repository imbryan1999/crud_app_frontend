import 'package:flutter/material.dart';
import 'package:fullstack_flutter_app/pages/create_data.dart';
import 'package:fullstack_flutter_app/pages/delete_user.dart';
import 'package:fullstack_flutter_app/pages/fetch_data.dart';
import 'package:fullstack_flutter_app/pages/update_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext) => CreateData()));
                  },
                  child: const Text('CREATE')),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => FetchData()));
              }, child: const Text('READ')),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => UpdateUser()));
              }, child: const Text('UPDATE')),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => DeleteUser()));
              }, child: const Text('DELETE'))
            ],
          ),
        ),
      ),
    );
  }
}
