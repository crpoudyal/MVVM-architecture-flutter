import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/data/response/status.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/utils/utils.dart';
import 'package:mvvm_architecture_flutter/view_model/home_view_model.dart';
import 'package:mvvm_architecture_flutter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }

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
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                child: Text(value.moviesList.message.toString()),
              );
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.moviesList.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stack) {
                            return const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            );
                          },
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(value.moviesList.data!.movies![index].title
                            .toString()),
                        subtitle: Text(value
                            .moviesList.data!.movies![index].year
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              Utils.averageRating(value
                                      .moviesList.data!.movies![index].ratings!)
                                  .toString(),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
          }
          return Container();
        }),
      ),
    );
  }
}
