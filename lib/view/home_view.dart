import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("MVVM Architecture"),
          actions: [
            IconButton(
                onPressed: () {
                  userPreference.remove().then((value) {
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  });
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        body: const Center(
          child: Text("Home Screen"),
        ));
  }
}
