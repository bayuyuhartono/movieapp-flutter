import 'package:flutter/material.dart';
import 'package:movie_addict/src/data/response/api_status.dart';
import 'package:movie_addict/src/view/widgets/category_list.dart';
import 'package:provider/provider.dart';
import 'package:movie_addict/src/view/widgets/main_carousel.dart';
import 'package:movie_addict/src/viewmodel/home_vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeVM(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Text(
                  "Flutter Movie App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 16),

                // Gunakan Consumer langsung
                Consumer<HomeVM>(builder: (context, viewModel, _) {
                  if (viewModel.popularData.status == ApiStatus.completed) {
                    return MainCarousel(
                      movieLists: viewModel.popularData.data?.results ?? [],
                      onTap: (movieId) => viewModel.onMovieTap(context, movieId),
                    );
                  }
                  return Container();
                }),
                
                SizedBox(height: 16),

                Consumer<HomeVM>(builder: (context, viewModel, _) {
                  if (viewModel.nowplayingData.status == ApiStatus.completed) {
                    return CategoryList(
                      title: "Now Playing", 
                      movieLists: viewModel.nowplayingData.data?.results ?? [],
                      onTap: (movieId) => viewModel.onMovieTap(context, movieId),
                    );
                  }
                  return Container();
                }),

                SizedBox(height: 16),

                Consumer<HomeVM>(builder: (context, viewModel, _) {
                  if (viewModel.actionData.status == ApiStatus.completed) {
                    return CategoryList(
                      title: "Action", 
                      movieLists: viewModel.actionData.data?.results ?? [],
                      onTap: (movieId) => viewModel.onMovieTap(context, movieId),
                    );
                  }
                  return Container();
                }),

                SizedBox(height: 16),

                Consumer<HomeVM>(builder: (context, viewModel, _) {
                  if (viewModel.horrorData.status == ApiStatus.completed) {
                    return CategoryList(
                      title: "Horror", 
                      movieLists: viewModel.horrorData.data?.results ?? [],
                      onTap: (movieId) => viewModel.onMovieTap(context, movieId),
                    );
                  }
                  return Container();
                }),

                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
