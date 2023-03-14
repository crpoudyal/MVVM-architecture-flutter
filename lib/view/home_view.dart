import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MVVM Architecture"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
          ],
        ),
        body: const Center(
          child: Text("Home Screen"),
        ));
  }
}
